# ICCAD-2021 CAD Contest Problem A：Functional ECO with Behavioral Change Guidance

## How to Use

This project is based on berkeley-abc. To compile, change directory to `./abc-master` and type in Terminal

`bash autorun.sh`

In this script, it will trigger make to compile, and try all tests case in $testlist.

To add your own cases, put your g1.v and r2.v file in a new directory in `./abc-master/tests/` , and add the directory name into `testlist` array in `./abc-master/autorun.sh` .