#!/bin/bash
# set -e

# normal=$(tput sgr0)
# black=$(tput setaf 0)
# red=$(tput setaf 1)
# green=$(tput setaf 2)
# yellow=$(tput setaf 3)
# blue=$(tput setaf 4)
# magenta=$(tput setaf 5)
# cyan=$(tput setaf 6)
# white=$(tput setaf 7)

# if [[ $1 -eq 0 ]] ; then
#   echo ""
#   printf "%40s\n" "${red}ERROR :: No simulator UUID provided${normal}"
#   printf "%40s\n" "Run [instruments -s devices] or go to [XCode > Window > Devices] to find simulator UUID"

#   exit 1
# fi

SIMULATOR_UUID=$1 
SEARCH_KEY=$2

echo ""
echo "*************************************"
echo "Tailing simulator's system.log"
echo ""
echo "Simulator UUID: ${SIMULATOR_UUID}"
echo "Search for key: ${SEARCH_KEY}"
echo "*************************************"
echo ""

tail -f ~/Library/Logs/CoreSimulator/${SIMULATOR_UUID}/system.log | grep "${SEARCH_KEY}"