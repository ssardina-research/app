"""
Generate task files for APP benchmarks as per the format below:
format_version: "2.0"
input_files:
- {PREFIX_DIR}/AIJ16/Barman/domain.pddl
- {PREFIX_DIR}/AIJ16/Barman/EIGHT50/prob001.pddl

options:
  output: AIJ16/Barman/EIGHT50/probl001

  Example run:

  $ python experiments/benchexe/gen_tasks.py experiments/benchexe/ ../../../benchmarks --set all
"""

import argparse
import os
import re

re_1 = r"prob(?P<num>[\d]+).pddl"
re_2 = r"prob(?P<num>[\d\-a-z]+)_problem.pddl"
re_3 = r"prob(?P<num>[\d\-a-z]+).pddl"
re_4 = r"pfile(?P<num>[\d]+-?b?)-[-a-z]+.pddl"

# default location - can be overridden by CLI --benchmarks
ROOT_BENCHMARKS = "./benchmarks/"

############################################################
# DEFINTIONS FOR EACH BENCHMARK SET
############################################################
SOCS_BENCHMARK_FOLDERS = [
    "Blocks-DEADENDS-MOVABILITY",
    "Blocks-DEADENDS-MOVABILITY",
    "ZenoTravel-DEADENDS-SIMPLE-REFUEL",
]
SOCS_FILE_FORMAT = "SOCS_$DOMAIN_$SUBDOMAIN_$ID.yml"

FOND_BENCHMARK_FOLDERS = ["BlocksWorld"]
FOND_FILE_FORMAT = "FOND_$DOMAIN_$SUBDOMAIN_$ID.yml"

AIJ_BENCHMARK_FOLDERS = [
    "Barman",
    "BlocksWorld",
    "Elevators",
    "Logistics",
    "PipesWorld",
    "Storage",
    "ZenoTravel",
]
AIJ_FILE_FORMAT = "AIJ_$DOMAIN_$SUBDOMAIN_$ID.yml"
# AIJ_BENCHMARK_FOLDERS = ["PipesWorld", "Storage", "ZenoTravel"]


IJCAI_BENCHMARK_FOLDERS = [
    "Airport",
    "Floortile",
    "GluedBW",
    "Logistics-TrickyRing",
    "Matching-BW",
    "Woodworking",
]
IJCAI_FILE_FORMAT = "IJCAI_$DOMAIN_$ID.yml"

DOMAIN_FILE = "domain.pddl"


# SOCS
def gen_socs():
    for _domain in SOCS_BENCHMARK_FOLDERS:
        _r = os.path.join(SOCS_ROOT, _domain)
        domain_file = os.path.join(_r, DOMAIN_FILE)

        _structures = [f for f in os.listdir(_r) if os.path.isdir(os.path.join(_r, f))]
        for _structure in _structures:
            _files_dict = {}
            prob_files = [
                f
                for f in os.listdir(os.path.join(_r, _structure))
                if f.endswith(".pddl") and f.startswith("pfile")
            ]

            for _problem in prob_files:
                _id = re.match(re_4, _problem).group("num")
                _pid = f"{_domain}_{_structure}_{_id}"
                _files_dict[_id] = [_pid, domain_file, _structure, _problem]

            for _key in sorted(_files_dict.keys()):
                _value = _files_dict[_key]
                _file_name = (
                    SOCS_FILE_FORMAT.replace("$DOMAIN", _domain)
                    .replace("$SUBDOMAIN", _value[2])
                    .replace("$ID", f"{_key}")
                )
                with open(os.path.join(TASKS_FOLDER, _file_name), "w") as f:
                    f.write('format_version: "2.0"\n')
                    f.write("input_files:\n")
                    f.write(f"- {PREFIX_DIR}/SOCS17/{_domain}/{DOMAIN_FILE}\n")
                    f.write(
                        f"- {PREFIX_DIR}/SOCS17/{_domain}/{_structure}/{_value[3]}\n"
                    )
                    f.write("\n")
                    f.write("options:\n")
                    f.write(
                        f"    output: SOCS17/{_domain}/{_structure}/{_value[3][0:-5]}"
                    )


# FOND
def gen_fond():
    for _domain in FOND_BENCHMARK_FOLDERS:
        _r = os.path.join(FOND_ROOT, _domain)
        domain_file = os.path.join(_r, DOMAIN_FILE)

        _structures = [f for f in os.listdir(_r) if os.path.isdir(os.path.join(_r, f))]
        for _structure in _structures:
            _files_dict = {}
            prob_files = [
                f
                for f in os.listdir(os.path.join(_r, _structure))
                if f.endswith(".pddl") and f.startswith("prob")
            ]

            for _problem in prob_files:
                _id = int(re.match(re_1, _problem).group("num"))
                _pid = f"{_domain}_{_structure}_{_id}"
                _files_dict[_id] = [_pid, domain_file, _structure, _problem]

            for _key in sorted(_files_dict.keys()):
                _value = _files_dict[_key]
                _file_name = (
                    FOND_FILE_FORMAT.replace("$DOMAIN", _domain)
                    .replace("$SUBDOMAIN", _value[2])
                    .replace("$ID", f"{_key}")
                )
                with open(os.path.join(TASKS_FOLDER, _file_name), "w") as f:
                    f.write('format_version: "2.0"\n')
                    f.write("input_files:\n")
                    f.write(f"- {PREFIX_DIR}/FOND/{_domain}/{DOMAIN_FILE}\n")
                    f.write(f"- {PREFIX_DIR}/FOND/{_domain}/{_structure}/{_value[3]}\n")
                    f.write("\n")
                    f.write("options:\n")
                    f.write(
                        f"    output: FOND/{_domain}/{_structure}/{_value[3][0:-5]}"
                    )


# AIJ
def gen_aij():
    for _domain in AIJ_BENCHMARK_FOLDERS:
        _r = os.path.join(AIJ_ROOT, _domain)
        domain_file = os.path.join(_r, DOMAIN_FILE)

        _structures = [f for f in os.listdir(_r) if os.path.isdir(os.path.join(_r, f))]
        for _structure in _structures:
            _files_dict = {}
            prob_files = [
                f
                for f in os.listdir(os.path.join(_r, _structure))
                if f.endswith(".pddl") and f.startswith("prob")
            ]

            for _problem in prob_files:
                _id = int(re.match(re_1, _problem).group("num"))
                _pid = f"{_domain}_{_structure}_{_id}"
                _files_dict[_id] = [_pid, domain_file, _structure, _problem]

            for _key in sorted(_files_dict.keys()):
                _value = _files_dict[_key]
                _file_name = (
                    AIJ_FILE_FORMAT.replace("$DOMAIN", _domain)
                    .replace("$SUBDOMAIN", _value[2])
                    .replace("$ID", f"{_key}")
                )
                with open(os.path.join(TASKS_FOLDER, _file_name), "w") as f:
                    f.write('format_version: "2.0"\n')
                    f.write("input_files:\n")
                    f.write(f"- {PREFIX_DIR}/AIJ16/{_domain}/{DOMAIN_FILE}\n")
                    f.write(
                        f"- {PREFIX_DIR}/AIJ16/{_domain}/{_structure}/{_value[3]}\n"
                    )
                    f.write("\n")
                    f.write("options:\n")
                    f.write(
                        f"    output: AIJ16/{_domain}/{_structure}/{_value[3][0:-5]}"
                    )


# IJCAI
def gen_ijcai():
    for _domain in IJCAI_BENCHMARK_FOLDERS:
        _r = os.path.join(IJCAI_ROOT, _domain)
        _files_dict = {}
        prob_files = [
            f
            for f in os.listdir(_r)
            if f.startswith("prob") and f.endswith(".pddl") and "domain" not in f
        ]
        _domain_file = None
        for _problem in prob_files:
            if _domain.lower() in [
                "airport",
                "floortile",
            ]:  ## different naming of problem files!
                _id = re.match(re_2, _problem).group("num")
                _last_idx = 13
            else:
                _id = re.match(re_3, _problem).group("num")
                _last_idx = 5
            _pid = f"{_domain}_{_id}"

            if (
                _domain.lower() == "airport"
            ):  # Airport has a separate domain per problem file
                _domain_file = f"prob{_id}_domain.pddl"
            else:
                _domain_file = DOMAIN_FILE
            _files_dict[_id] = [_pid, _domain_file, _problem]

        for _key in sorted(_files_dict.keys()):
            _value = _files_dict[_key]
            _file_name = IJCAI_FILE_FORMAT.replace("$DOMAIN", _domain).replace(
                "$ID", f"{_key}"
            )
            with open(os.path.join(TASKS_FOLDER, _file_name), "w") as f:
                f.write('format_version: "2.0"\n')
                f.write("input_files:\n")
                f.write(f"- {PREFIX_DIR}/IJCAI17-Trapper/{_domain}/{_value[1]}\n")
                f.write(f"- {PREFIX_DIR}/IJCAI17-Trapper/{_domain}/{_value[2]}\n")
                f.write("\n")
                f.write("options:\n")
                f.write(f"    output: IJCAI17-Trapper/{_domain}/{_value[2][0:-5]}")


if __name__ == "__main__":
    # CLI options
    parser: argparse.ArgumentParser = argparse.ArgumentParser(
        description="Generate APP benchmarks task for BenchExec"
    )
    parser.add_argument("folder", help="place to put the tasks.")
    parser.add_argument("prefix", help="prefix to benchmark folder.")

    parser.add_argument(
        "--set",
        default="aij",
        help="Which FOND set to generate.",
        choices=["socs", "aij", "ijcai", "fond", "all"],
    )
    parser.add_argument(
        "--benchmarks",
        default=ROOT_BENCHMARKS,
        help="Folder where benchmarks are located (Default: $(default)s).)",
    )
    args = parser.parse_args()

    SOCS_ROOT = os.path.join(args.benchmarks, "SOCS17")
    FOND_ROOT = os.path.join(args.benchmarks, "FOND")
    AIJ_ROOT = os.path.join(args.benchmarks, "AIJ16")
    IJCAI_ROOT = os.path.join(args.benchmarks, "IJCAI17-Trapper")

    # "./benchmarks/benchexe/tasks"
    TASKS_FOLDER = os.path.join(args.folder, "tasks")
    PREFIX_DIR = args.prefix

    if not os.path.exists(TASKS_FOLDER):
        os.makedirs(TASKS_FOLDER, exist_ok=True)

    # generate YAML task files for selected set
    which_ones = [args.set]
    if args.set == "all":
        which_ones = ["socs", "aij", "ijcai", "fond"]

    for x in which_ones:
        if x == "socs":
            gen_socs()
        elif x == "fond":
            gen_fond()
        elif x == "aij":
            gen_aij()
        elif x == "ijcai":
            gen_ijcai()
