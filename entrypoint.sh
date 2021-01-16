#!/bin/bash
set -euxo pipefail
cd $GITHUB_WORKSPACE

# Echo version information
htmltest --version

# Run the test suite
htmltest ${INPUT_PATH:+ $INPUT_PATH} \
  ${INPUT_CONFIG:+ -c $INPUT_CONFIG} \
  ${INPUT_LOG_LEVEL:+ -l $INPUT_LOG_LEVEL} \
  ${INPUT_SKIP_EXTERNAL:+ -s}
