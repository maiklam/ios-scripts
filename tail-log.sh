#!/bin/bash
set -e

normal=$(tput sgr0)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

if [[ $1 -eq 0 ]] ; then
  echo ""
  echo -e "${red}[ERROR] No simulator UUID provided${normal}"
  echo ''
  echo '----------------------------------------------------------------------------'
  echo '| Please provide simulator UUID and keyword in following format:           |'
  echo '| $ ./tail-log.sh <SIMULATOR_UUID> <OPTIONAL SEARCH_KEY>                   |'
  echo '----------------------------------------------------------------------------'
  echo '| To find UUID of simulator, either                                        |'
  echo '| * run `instruments -s devices`                                           |' 
  echo '| * or in xCode, select `Window > Devices`                                 |'
  echo '| * or in Simulator, select `Hardware > Devices > Manage devices`          |'
  echo '----------------------------------------------------------------------------'

  exit 1
fi

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

tail -f ~/Library/Logs/CoreSimulator/${SIMULATOR_UUID}/system.log \
 | grep --color=always --line-buffered "${SEARCH_KEY}" \
 | sed 's/.*D | //'