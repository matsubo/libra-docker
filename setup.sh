#!/bin/bash

expect -c "
set timeout 30
spawn env LANG=C scripts/dev_setup.sh
expect \"Proceed with installing necessary dependencies\"
send \"y\n\"
interact
"
