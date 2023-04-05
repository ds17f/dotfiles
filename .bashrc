#!/bin/bash

# VI Edit Mode
set -o vi

aws_get_ssm() {
  SSM_PATH=$1
  FILTER=$2
  REGION=${3-"us-east-1"}
  VERBOSE=${4}
  # write to stderr so that we can pipe the output to JQ without error
  echo "aws --region ${REGION} ssm get-parameters-by-path --path \"${SSM_PATH}\" --recursive  | jq -S '.Parameters[] | select(.Name|contains(\"$FILTER\"))'" >&2
  aws --region ${REGION} ssm get-parameters-by-path --path "${SSM_PATH}" --recursive  | jq -S ".Parameters[] | select(.Name|contains(\"$FILTER\"))"
}

export -f aws_get_ssm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dsilbergleithcu/.sdkman"
[[ -s "/Users/dsilbergleithcu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dsilbergleithcu/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# git cleanup alias
alias gitcleanup='git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d'
