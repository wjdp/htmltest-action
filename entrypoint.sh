#!/bin/bash
set -euxo pipefail
cd $GITHUB_WORKSPACE
ls
htmltest ${INPUT_PATH:+ $INPUT_PATH} \
  ${INPUT_CONFIG:+ -c $INPUT_CONFIG} \
  ${INPUT_LOG_LEVEL:+ -l $INPUT_LOG_LEVEL} \
  ${INPUT_SKIP_EXTERNAL:+ -s}
