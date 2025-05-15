####
## timelimit="1800s"
## memlimit="2048 MB
##
MAX_TIME = 1800
MAX_MEM = 2048

# load the packages
library(dplyr)
library(ggpubr)


# read the csv file (generated from benchexec processing script)
results_csv = paste("./results", "results_all.csv", sep="/")
df_raw = read.csv(results_csv)

df_raw %>% group_by(run) %>% summarise(count=n())

ignore_solvers = c("lpg_small", "pr2", "pr2_inv0")
ignore_set = c("FOND")

# filter out the sets and solvers to ignore
df = filter(df_raw, !set %in% ignore_set)
df = filter(df, !run %in% ignore_solvers )

# set solver as a category
df$run = as.factor(df$run)

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
solver_mapping = c("lpg" = "LPG", "lpg_small" = "LPGSm", "prp" = "PRP", "prp_inv0" = "PRPd", "pr2" = "PR2", "pr2_inv0" = "PR2d")
df = df %>%mutate(run = recode(run, !!!solver_mapping))
df$run <- factor(df$run, levels=sort(unique(df$run)))

# add count of instances per domain
df = df %>%
    group_by(set, domain, run) %>%
    mutate(domain_count = n())

# add count of instances per subdomain
df = df %>%
  group_by(set, domain, sub_domain, run) %>%
  mutate(sub_domain_count = n())

### Combine domain and source
df = df %>%
  mutate(benchmark = if_else(set == "IJCAI", 
                             paste(set, sep=""),
                             paste(set,":",domain, sep="")
                             ))

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

# ignore LPGsm for now
df_meta = df_meta %>% filter(! run %in% c("LPGSm", "PR2", "PR2d"))

# check winners and ties
df_winners = df_meta %>% 
  group_by(benchmark, sub_domain) %>%
  filter(coverage == max(coverage)) %>%
  summarise(winners = paste(run, collapse = ", "), max_coverage = max(coverage), how_many=n())

knitr::kable(df_winners %>% arrange(benchmark, desc(max_coverage)), format = "markdown")


# clear winners
winner_count = df_winners %>% filter(how_many==1) %>% group_by(winners) %>% summarise(count=n())
knitr::kable(winner_count, format = "markdown")

# double ties
winner_count = df_winners %>% filter(how_many==2) %>% group_by(winners) %>% summarise(count=n())
knitr::kable(winner_count, format = "markdown")

# tripple ties
winner_count = df_winners %>% filter(how_many==3) %>% group_by(winners) %>% summarise(count=n())
knitr::kable(winner_count, format = "markdown")


### COMPARE metrics
## for 100% coverage we use paired test, otherwise non-paired
compare_metrics = function(choice, benchmark, sub_domain, paired) {
  
  # Subset the data correctly
  df_t <- df %>%
        filter(benchmark == !!benchmark & sub_domain == !!sub_domain & run %in% choice & solved_int==1) %>% ungroup() %>% select(task, run, cputime, memory_mb, policy_size)
  
  df_t <- df_t %>% arrange(task, run)
  
  # Initialize a dataframe to store the summary and p-values
  summary_table <- df_t %>%
    group_by(run) %>%
    summarise(
      average_time = mean(cputime, na.rm = TRUE),
      average_memory = mean(memory_mb, na.rm = TRUE),
      average_policy = mean(policy_size, na.rm = TRUE),
      std_time = sd(cputime, na.rm=TRUE)
    )  
  
  # Perform Wilcoxon test on CPU time, memory usage, and policy size
  time_results <- compare_means(cputime ~ run, df_t, method = "wilcox.test", paired = paired)
  memory_results <- compare_means(memory_mb ~ run, df_t, method = "wilcox.test", paired = paired)
  policy_results <- compare_means(policy_size ~ run, df_t, method = "wilcox.test", paired = paired)
  
  # Extract the p-values from the test results
  p_value_time <- time_results$p[1]  # The first p-value, you can modify this for pairwise p-values if needed
  p_value_memory <- memory_results$p[1]
  p_value_policy <- policy_results$p[1]
  
  # Add the p-values as new columns to the summary table
  summary_table <- summary_table %>%
    mutate(
      p_value_time = p_value_time,
      p_value_memory = p_value_memory,
      p_value_policy = p_value_policy,
      benchmark = benchmark,         # Add benchmark column
      sub_domain = sub_domain        # Add sub_domain column
    )
  
  # Return the summary table
  return(summary_table)
}



## AIJ Barman
results = compare_metrics(c("PRP", "PRPd"), "AIJ:Barman", "RNG50", TRUE)
knitr::kable(results, format = "markdown")

### AIJ Blocksworld
choices = list(c("LPG", "PRP"), c("LPG", "PRPd"), c("PRP", "PRPd"))
benchmark = "AIJ:BlocksWorld"
sub_domains = unique((df %>% filter(benchmark == !!benchmark))$sub_domain)
sub_domains = sub_domains[!(sub_domains %in% "SCC2")]
idx = 1
for (choice in choices){
  cat("###", choice)
  for (sub_domain in sub_domains){
    results = compare_metrics(choice, benchmark, sub_domain, TRUE)
    print(knitr::kable(results, format = "markdown"))
  }
  cat("\n\n")
}

### AIJ Elevators
choices = list(c("LPG", "PRP"))
benchmark = "AIJ:Elevators"
sub_domains = list("RND50")
idx = 1
cat("##", "AIJ: Elevators")
for (choice in choices){
  cat("###", choice)
  for (sub_domain in sub_domains){
    results = compare_metrics(choice, benchmark, sub_domain, TRUE)
    print(knitr::kable(results, format = "markdown"))
  }
  cat("\n\n")
}

choices = list(c("LPG", "PRP"), c("LPG", "PRPd"), c("PRP", "PRPd"))
benchmark = "AIJ:Elevators"
sub_domains = list("EHT50", "RNG50")
idx = 1
cat("##", "AIJ: Elevators")
for (choice in choices){
  cat("###", choice)
  for (sub_domain in sub_domains){
    results = compare_metrics(choice, benchmark, sub_domain, TRUE)
    print(knitr::kable(results, format = "markdown"))
  }
  cat("\n\n")
}

### AIJ Logistcs
choices = list(c("LPG", "PRP"), c("LPG", "PRPd"), c("PRP", "PRPd"))
benchmark = "AIJ:Logistics"
sub_domains = list("RNG50")
idx = 1
cat("##", "AIJ: Elevators")
for (choice in choices){
  cat("###", choice)
  for (sub_domain in sub_domains){
    results = compare_metrics(choice, benchmark, sub_domain, TRUE)
    print(knitr::kable(results, format = "markdown"))
  }
  cat("\n\n")
}


results = compare_metrics(c("LPG", "PRPd"), "AIJ:Logistics", "EHT50", TRUE)
knitr::kable(results, format = "markdown")

results = compare_metrics(c("PRP", "PRPd"), "AIJ:Logistics", "TRING", TRUE)
knitr::kable(results, format = "markdown")

#AIJ:PipesWorld
choices = list(c("LPG", "PRP"), c("LPG", "PRPd"), c("PRP", "PRPd"))
benchmark = "AIJ:PipesWorld"
sub_domains = list("EHT50", "RNG50")
idx = 1
for (choice in choices){
  cat("###", choice)
  for (sub_domain in sub_domains){
    results = compare_metrics(choice, benchmark, sub_domain, TRUE)
    print(knitr::kable(results, format = "markdown"))
  }
  cat("\n\n")
}

#AIJ Storage
results = compare_metrics(c("LPG", "PRPd"), "AIJ:Storage", "RND50", TRUE)
knitr::kable(results, format = "markdown")

df_t <- df %>%
  filter(benchmark == !!"AIJ:Storage" & sub_domain == !!"RND50" & run %in% c("LPG", "PRPd") & solved_int==1) %>% ungroup() %>% select(task, run, cputime, memory_mb, policy_size)


#AIJ Zenotravel
results = compare_metrics(c("PRP", "PRPd"), "AIJ:ZenoTravel", "SCC2", TRUE)
knitr::kable(results, format = "markdown")
benchmark = "AIJ:ZenoTravel"
sub_domain = "SCC2"
choice = c("PRP", "PRPd")
df_task = df %>%
  filter(benchmark == !!benchmark & sub_domain == !!sub_domain & run %in% choice & solved_int==1) %>% ungroup() %>% select(task, run, cputime, memory_mb, policy_size)

choices = list(c("LPG", "PRP"), c("LPG", "PRPd"), c("PRP", "PRPd"))
benchmark = "AIJ:ZenoTravel"
sub_domains = list("RNG50")
idx = 1
for (choice in choices){
  cat("###", choice)
  for (sub_domain in sub_domains){
    results = compare_metrics(choice, benchmark, sub_domain, TRUE)
    print(knitr::kable(results, format = "markdown"))
  }
  cat("\n\n")
}


# ijcai
results = compare_metrics(c("PRP", "PRPd"), "IJCAI", "LTRng", TRUE)
knitr::kable(results, format = "markdown")

benchmark = "IJCAI"
sub_domain = "LTRng"
choice = c("PRP", "PRPd")
df_task = df %>%
  filter(benchmark == !!benchmark & sub_domain == !!sub_domain & run %in% choice & solved_int==1) %>% ungroup() %>% select(task, run, cputime, memory_mb, policy_size)


results = compare_metrics(c("PRP", "PRPd"), "IJCAI", "GldBW", TRUE)
knitr::kable(results, format = "markdown")

benchmark = "IJCAI"
sub_domain = "GldBW"
choice = c("PRP", "PRPd")
df_task = df %>%
  filter(benchmark == !!benchmark & sub_domain == !!sub_domain & run %in% choice & solved_int==1) %>% ungroup() %>% select(task, run, cputime, memory_mb, policy_size)



#SOCS Blocks
benchmark = "SOCS:Blocks"
sub_domain = "CHN6"
choice = c("PRP", "PRPd")
df_task = df %>%
  filter(benchmark == !!benchmark & sub_domain == !!sub_domain & run %in% choice & solved_int==1) %>% ungroup() %>% select(task, run, cputime, memory_mb, policy_size)


choices = list(c("PRP", "PRPd"))
benchmark = "SOCS:Blocks"
sub_domains = list("STL5", "CHN6")
idx = 1
for (choice in choices){
  cat("###", choice)
  for (sub_domain in sub_domains){
    results = compare_metrics(choice, benchmark, sub_domain, TRUE)
    print(knitr::kable(results, format = "markdown"))
  }
  cat("\n\n")
}

# SOCS Zeno
choices = list(c("PRP", "PRPd"))
benchmark = "SOCS:ZenoTravel"
sub_domains = list("RND54", "EHT50", "RNG50", "RNG5", "EHT4", "SCC56", "RND3", "SCC3", "STL5", "CHN6")
idx = 1
for (choice in choices){
  cat("###", choice)
  for (sub_domain in sub_domains){
    results = compare_metrics(choice, benchmark, sub_domain, TRUE)
    print(knitr::kable(results, format = "markdown"))
  }
  cat("\n\n")
}

benchmark = "SOCS:ZenoTravel"
sub_domain = "CHN6"
choice = c("PRP", "PRPd")
df_task = df %>%
  filter(benchmark == !!benchmark & sub_domain == !!sub_domain & run %in% choice & solved_int==1) %>% ungroup() %>% select(task, run, cputime, memory_mb, policy_size)




### FOND
ignore_solvers = c("lpg_small","lpg", "prp2", "prp2_inv0")
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
df = df %>%
  mutate(benchmark = if_else(set == "IJCAI", 
                             paste(set, sep=""),
                             paste(set,":",domain, sep="")
  ))

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


# check winners and ties
df_winners = df_meta %>% 
  group_by(benchmark, sub_domain) %>%
  filter(coverage == max(coverage)) %>%
  summarise(winners = paste(run, collapse = ", "), max_coverage = max(coverage), how_many=n())

knitr::kable(df_winners %>% arrange(benchmark, desc(max_coverage)), format = "markdown")


# clear winners
winner_count = df_winners %>% filter(how_many==1) %>% group_by(winners) %>% summarise(count=n())
knitr::kable(winner_count, format = "markdown")

# double ties
winner_count = df_winners %>% filter(how_many==2) %>% group_by(winners) %>% summarise(count=n())
knitr::kable(winner_count, format = "markdown")

### FOND  Blocksworld
choices = list(c("PRP", "PRPd"))
benchmark = "FOND:BlocksWorld"
sub_domains = unique((df %>% filter(benchmark == !!benchmark))$sub_domain)
for (choice in choices){
  cat("##", choice)
  for (sub_domain in sub_domains){
    results = compare_metrics(choice, benchmark, sub_domain, TRUE)
    print(knitr::kable(results, format = "markdown"))
  }
  cat("\n\n")
}
