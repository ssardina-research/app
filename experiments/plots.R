####
## timelimit="1800s"
## memlimit="2048 MB
##
MAX_TIME = 1800
MAX_MEM = 2048

# load the packages
library(rstudioapi)
library(ggplot2)
library(dplyr)
library(tikzDevice)
library(ggthemes)
library(ggpubr)
library(ggh4x)
library(ggtext)
library(patchwork)
library(grid)

## Change the current working directory to ./experiments

# read the csv file (generated from benchexec processing script)
results_csv = paste("./results", "results_all.csv", sep="/")
df_raw = read.csv(results_csv)

ignore_solvers = c("lpg_small", "pr2", "pr2_inv0")
ignore_set = c("FOND")
num_solvers = 3
# filter out the sets and solvers to ignore
df = filter(df_raw, !set %in% ignore_set)
df = filter(df, !run %in% ignore_solvers )
# set solver as a category
df$run = as.factor(df$run)

colours = c("#0072B2", "#D55E00", "#009E73", "#CC79A7", "#F0E442")
time_colour = colours[1]
memory_colour = colours[2]
coverage_color <- rgb(0.90, 0.90, 0.90, alpha = 0.6)  # light gray with 70% opacity

# change IJCAI sub-domain
df<- df %>%
  mutate(sub_domain = if_else(set == "IJCAI", domain, sub_domain))

df<- df %>%
  mutate(domain = if_else(set == "IJCAI", "IJCAI", domain))

##### Rename the sub-domains to max of 5 characters
subdomain_mapping = c("EIGHT50" = "EHT50", "RING50" = "RNG50", "RND50" = "RND50", 
                       "SCC56" = "SCC56", "EIGHT4-51" = "EHT4", "EIGHT6" = "EHT6",
                       "LIN10-110" = "LIN10", "RING5-100" = "RNG5", "RING6" = "RNG6",
                       "RND3-23" = "RND3", "RND6" = "RND6", "SCC2-20" = "SCC2",
                       "SCC3-11" = "SCC3", "CHN6-101" = "CHN6", "RND54" = "RND54",
                       "STL5-43" = "STL5", "TRICKY-RING" = "TRING", "SCC6"="SCC6",
                      "Airport" = "AiRPT", "Floortile" = "FTile", "GluedBW" = "GldBW", 
                      "Logistics-TrickyRing" = "LTRng", "Matching-BW" = "MchBW", "Woodworking" = "Wood")

df <- df %>%mutate(sub_domain = recode(sub_domain, !!!subdomain_mapping))

df$sub_domain <- factor(df$sub_domain, levels=sort(unique(df$sub_domain)))

##### Rename the sub-solvers to max of 5 characters
solver_mapping = c("lpg" = "LPG", "lpg_small" = "LPGSm", "prp" = "PRP", "prp_inv0" = "PRPd", "prp2" = "PRP2", "prp2_inv0" = "PRP2d")
df = df %>%mutate(run = recode(run, !!!solver_mapping))
df$run <- factor(df$run, levels=sort(unique(df$run)))

# add count of instances per domain
df = df %>%
    group_by(set, domain, run) %>%
    mutate(domain_count = n())

df = df %>%
  group_by(set, domain, sub_domain, run) %>%
  mutate(sub_domain_count = n())

### Combine domain and source
df = df %>%
  mutate(benchmark = if_else(set == "IJCAI", 
                             paste(set, sep=""),
                             paste(set,":",domain, sep="")
                             ))


#df$benchmark = paste(df$set,":",df$domain, " (", df$domain_count, ")", sep="")

# associate 1 with solved, and 0 with unsolved
df$solved_int <- ifelse(df$solved == "True", 1, 0)
df_solved = filter(df, solved_int==1)

# compute the coverage
# group by solver, source, domain, subdomain, and then count the total instances and the total solved instances
df_all = df %>%
              group_by(run, set, benchmark, sub_domain) %>%
              summarise(n=n(), total_solved=sum(solved_int), coverage=round(mean(solved_int)*100, 1), 
                        median_time=median(cputime[solved_int==1]), mean_time=mean(cputime[solved_int==1]),
                        median_memory=median(memory_mb[solved_int==1]), mean_memory=mean(memory_mb[solved_int==1]),
                        median_policy=median(policy_size[solved_int==1]), mean_policy=mean(policy_size[solved_int==1])) %>%
              as.data.frame()

# normalise the compute time and memory
df_all$median_time_norm = round(100*df_all$median_time/MAX_TIME, 2)
df_all$mean_time_norm = round(100*df_all$mean_time/MAX_TIME, 2)
df_all$median_memory_norm = round(100*df_all$median_memory/MAX_MEM, 2)
df_all$mean_memory_norm = round(100*df_all$mean_memory/MAX_MEM, 2)

## find benchmarks were coverage is zero for all solvers
df_coverage = df_all %>%
                group_by(set, benchmark, sub_domain) %>%
                summarise(mean_coverage=mean(coverage)) %>%
                as.data.frame()
df_zero_coverage = df_coverage %>% filter(mean_coverage==0)
df_zero_coverage

df_meta <- df_all %>%
  anti_join(df_zero_coverage, by = c("set", "benchmark", "sub_domain"))


### Separate base and our approach
df_meta = df_meta %>%
  mutate(control = if_else(run %in% c("LPG", "LPGSm"), 0,1))
df_meta$control <- factor(df_meta$control, levels=sort(unique(df_meta$control)))

df_meta = df_meta %>%
  group_by(benchmark,run) %>%
  mutate(benchmark_label = paste(benchmark, " (", sum(n), ")", sep="")
  )
#sub_domain_count = aggregate(sub_domain~benchmark, data = df, FUN = function(x) length(unique(x)))


strip_theme = strip_nested(
  by_layer_x = TRUE,
  text_x = list(
    element_text(size = 7, face = "bold", color = "#111"),
    element_text(size = 6.5, face = "italic", color = "#333")
  ),
background_x = list(
    element_rect(fill = "#ddd", color = "#ddd", size = 0.5),
    element_part_rect(fill = "#efefef", color = "#333",side = "lr")
  )
)

#0072B2", "#D55E00"
control_cols <- c("0" = "#0072B2", "1" = "#D55E00")
d = c("AIJ:BlocksWorld (293)", "AIJ:Barman (80)")
df1 = filter(df_meta, benchmark_label %in% d)
df1$run = as.factor(df1$run)
ggplot(df1, aes(x=run,y=coverage))  + geom_bar(stat = "identity", fill=coverage_color, colour=coverage_color) +
  geom_text(aes(label = run,y=pmax(coverage + 2, coverage + 0.5)), vjust = 0.25, color = "grey30", size = 3, angle=90, hjust=-0.15) +
  geom_point(aes(y=mean_time_norm,colour=control),size=2,shape="+") +
  geom_point(aes(y=mean_memory_norm,colour=control),size=1,shape=17) +
  theme_pubr() + facet_nested(.~ benchmark_label + sub_domain,nest_line = TRUE,  switch = "x", strip=strip_theme) +
#  scale_x_discrete(position = "top")+
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), panel.grid.major.x = element_blank()) +
  theme(strip.placement = "outside", legend.position = "none", strip.text.x = element_text(size = 10)) +
  theme(panel.grid.major = element_line(linetype = "dashed", color = "grey80", linewidth = 0.5)) + 
  theme(strip.background = element_blank()) +ylim(0,110) +  scale_y_continuous(breaks = c(0, 25, 50,75,100)) +
  theme(axis.title.x = element_blank(), axis.title.y = element_blank()) + scale_color_manual(values = control_cols) +
  coord_cartesian(clip = "off") 


plot_benchmarks = function(which_ones){
  df1 = filter(df_meta, benchmark %in% which_ones)
  p = ggplot(df1, aes(x=run,y=coverage))  + geom_bar(stat = "identity", fill=coverage_color, colour=coverage_color) +
    geom_text(aes(label = run,y=pmin(90,pmax(25, coverage))), vjust = 0.25, color = "grey40", size = 2, angle=90, hjust=-0.15) +
    geom_point(aes(y=mean_time_norm,colour=control),size=2.5,shape="+") +
    geom_point(aes(y=mean_memory_norm,colour=control),size=0.75,shape=17) +
    theme_pubr() + facet_nested(.~ benchmark_label + sub_domain,nest_line = TRUE,  switch = "x", strip=strip_theme) +
    theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), panel.grid.major.x = element_blank()) +
    theme(strip.placement = "outside", legend.position = "none", strip.text.x = element_text(size = 10)) +
    theme(panel.grid.major = element_line(linetype = "dashed", color = "grey80", linewidth = 0.5)) + 
    theme(strip.background = element_blank()) +ylim(0,110) +  scale_y_continuous(breaks = c(0, 25, 50,75,100)) +
    #theme(axis.title.y = element_markdown()) +
    #labs(y = ylabel) +
    coord_cartesian(clip = "off") +
    theme(axis.title.x = element_blank(), axis.title.y = element_blank(),axis.text=element_text(size=7)) + scale_color_manual(values = control_cols) 
  p
}

socs_10_1 = plot_benchmarks(c("SOCS:Blocks"))
socs_10_1
socs_10_2 = plot_benchmarks(c("SOCS:ZenoTravel"))

aij_14 = plot_benchmarks(c("AIJ:BlocksWorld"))
ijcai = plot_benchmarks(c("IJCAI"))

aij_4_1 = plot_benchmarks(c("AIJ:Barman"))
aij_4_2 = plot_benchmarks(c("AIJ:PipesWorld"))
aij_4_3 = plot_benchmarks(c("AIJ:Elevators"))
ai4_4_4 = plot_benchmarks(c("AIJ:Storage"))

aij_5_1 = plot_benchmarks(c("AIJ:Logistics)"))
aij_5_2 = plot_benchmarks(c("AIJ:ZenoTravel"))

socs = plot_benchmarks(c("SOCS:Blocks", "SOCS:ZenoTravel"))

aij_1 = plot_benchmarks(c("AIJ:BlocksWorld"))
aij_2 = plot_benchmarks(c("AIJ:Barman","AIJ:PipesWorld","AIJ:Elevators","AIJ:Storage"))
aij_3 = plot_benchmarks(c("AIJ:Logistics", "AIJ:ZenoTravel", "IJCAI"))


combined_plot <- (aij_3) /aij_2/aij_1/socs +
  plot_layout(axis_titles = "collect") 
print(combined_plot)

tikz(file = "./main_results.tex", width=7.5, height = 5.5, standAlone = TRUE, colorFileName = "%s_colors.tex")
print(combined_plot)
dev.off()

### now for Fond ####
#######################
ignore_solvers = c("lpg_small", "pr2", "pr2_inv0", "prp_inv0")
num_solvers = 1
# filter out the sets and solvers to ignore
df = filter(df_raw, set %in% ignore_set)
df = filter(df, !run %in% ignore_solvers )
# set solver as a category
df$run = as.factor(df$run)
df <- df %>%mutate(sub_domain = recode(sub_domain, !!!subdomain_mapping))

df$sub_domain <- factor(df$sub_domain, levels=sort(unique(df$sub_domain)))

##### Rename the sub-solvers to max of 5 characters
df = df %>%mutate(run = recode(run, !!!solver_mapping))
df$run <- factor(df$run, levels=sort(unique(df$run)))

# add count of instances per domain
df = df %>%
  group_by(set, domain, run) %>%
  mutate(domain_count = n())

df = df %>%
  group_by(set, domain, sub_domain, run) %>%
  mutate(sub_domain_count = n())

### Combine domain and source
# df = df %>%
#   mutate(benchmark = if_else(set == "IJCAI", 
#                              paste(set, " (", domain_count, ")", sep=""),
#                              paste(set,":",domain, " (", domain_count, ")", sep="")
#   ))
df = df %>%
  mutate(benchmark = if_else(set == "IJCAI", 
                             paste(set, sep=""),
                             paste(set,":",domain, sep="")
  ))


#df$benchmark = paste(df$set,":",df$domain, " (", df$domain_count, ")", sep="")

# associate 1 with solved, and 0 with unsolved
df$solved_int <- ifelse(df$solved == "True", 1, 0)
df_solved = filter(df, solved_int==1)

# compute the coverage
# group by solver, source, domain, subdomain, and then count the total instances and the total solved instances
df_all = df %>%
  group_by(run, set, benchmark, sub_domain) %>%
  summarise(n=n(), total_solved=sum(solved_int), coverage=round(mean(solved_int)*100, 1), 
            median_time=median(cputime[solved_int==1]), mean_time=mean(cputime[solved_int==1]),
            median_memory=median(memory_mb[solved_int==1]), mean_memory=mean(memory_mb[solved_int==1]),
            median_policy=median(policy_size[solved_int==1]), mean_policy=mean(policy_size[solved_int==1])) %>%
  as.data.frame()

# normalise the compute time and memory
df_all$median_time_norm = round(100*df_all$median_time/MAX_TIME, 2)
df_all$mean_time_norm = round(100*df_all$mean_time/MAX_TIME, 2)
df_all$median_memory_norm = round(100*df_all$median_memory/MAX_MEM, 2)
df_all$mean_memory_norm = round(100*df_all$mean_memory/MAX_MEM, 2)

## find benchmarks were coverage is zero for all solvers
df_coverage = df_all %>%
  group_by(set, benchmark, sub_domain) %>%
  summarise(mean_coverage=mean(coverage)) %>%
  as.data.frame()
df_zero_coverage = df_coverage %>% filter(mean_coverage==0)
df_zero_coverage

df_meta <- df_all %>%
  anti_join(df_zero_coverage, by = c("set", "benchmark", "sub_domain"))

df_meta = df_meta %>%
   mutate(benchmark_label = paste(benchmark, " (", sum(n), ")", sep="")
   )

strip_theme = strip_nested(
  by_layer_x = TRUE,
  text_x = list(
    element_text(size = 7, face = "bold", color = "#111"),
    element_text(size = 5, face = "bold", color = "#333")
  ),
  background_x = list(
    element_rect(fill = "#ddd", color = "#ddd", size = 0.5),
    element_part_rect(fill = "#efefef", color = "#333",side = "lr")
  )
)

p=ggplot(df_meta, aes(x=run,y=coverage))  + geom_bar(stat = "identity", fill=coverage_color, colour=coverage_color, width=1) +
  #geom_text(aes(label = run,y=pmin(70, coverage)), vjust = 0.25, color = "grey30", size = 2, angle=90, hjust=-0.15) +
  geom_point(aes(y=mean_time_norm),size=2,shape="+",colour = colours[1]) +
  geom_point(aes(y=mean_memory_norm),size=1,shape=17,colour = colours[1]) +
  theme_pubr() + 
  facet_nested(.~ benchmark_label + sub_domain,nest_line = TRUE,  switch = "x", strip=strip_theme,scales    = "free_x") +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), panel.grid.major.x = element_blank()) +
  theme(strip.placement = "outside", legend.position = "none",axis.text.y = element_text(size = 6), strip.text.x = element_text(size = 8)) +
  theme(panel.grid.major = element_line(linetype = "dashed", color = "grey80", linewidth = 0.5)) + 
  theme(strip.background = element_blank()) +ylim(0,110) +  scale_y_continuous(breaks = c(0, 25, 50,75,100)) +
  theme(axis.title.x = element_blank(), axis.title.y = element_blank(), panel.spacing.x     = unit(0.1, "lines")) +
  scale_x_discrete(expand = c(0,0)) +  
  coord_cartesian(clip = "off") 

print(p)

tikz(file = "./fond_results.tex", width=4, height = 1.5, standAlone = TRUE, colorFileName = "%s_colors.tex")
print(p)
dev.off()
