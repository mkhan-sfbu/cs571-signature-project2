#!/bin/bash
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"  # cd current directory
CUR_DIR=$(pwd)
echo "Current Directory: ${CUR_DIR}"
export NLTK_DATA=${CUR_DIR}/nltk_data
echo "NLTK Data Path: ${NLTK_DATA}"
export MPLBACKEND=TKAgg
if ! command -v python &> /dev/null
then
  echo "python could not be found"
  if ! command -v python3 &> /dev/null
  then
    echo "python3 could not be found"
    exit
  fi
  shopt -s expand_aliases
  alias python='python3'
fi
#exec bash
cd ${CUR_DIR}/flask-summary
python app.py
