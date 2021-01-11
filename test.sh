#!/bin/sh
docker build -t htmltest-action .

echo "❌ No config nor path, fails"
docker run -it --rm -e GITHUB_WORKSPACE=/github/workspace -v $PWD/fixtures/empty:/github/workspace htmltest-action
if [ "$?" -eq "0" ]; then echo "❌❌❌ FAIL ❌❌❌"; exit 1; fi

echo "✅ Path but no files, passes"
docker run -it --rm -e GITHUB_WORKSPACE=/github/workspace -e INPUT_PATH=fixtures/empty -v $PWD:/github/workspace htmltest-action
if [ "$?" -ne "0" ]; then echo "❌❌❌ FAIL ❌❌❌"; exit 1; fi

echo "✅ Path with good files, passes"
docker run -it --rm -e GITHUB_WORKSPACE=/github/workspace -e INPUT_PATH=fixtures/pass -v $PWD:/github/workspace htmltest-action
if [ "$?" -ne "0" ]; then echo "❌❌❌ FAIL ❌❌❌"; exit 1; fi

echo "❌ Path with bad files, fails"
docker run -it --rm -e GITHUB_WORKSPACE=/github/workspace -e INPUT_PATH=fixtures/fail -v $PWD:/github/workspace htmltest-action
if [ "$?" -eq "0" ]; then echo "❌❌❌ FAIL ❌❌❌"; exit 1; fi

echo "✅ Config provided, passes"
docker run -it --rm -e GITHUB_WORKSPACE=/github/workspace -e INPUT_CONFIG=fixtures/with_config/.htmltest.yml -v $PWD:/github/workspace htmltest-action
if [ "$?" -ne "0" ]; then echo "❌❌❌ FAIL ❌❌❌"; exit 1; fi

echo "✅ Test extra options"
docker run -it --rm -e GITHUB_WORKSPACE=/github/workspace -e INPUT_CONFIG=fixtures/with_config/.htmltest.yml -e INPUT_LOG_LEVEL=0 -e INPUT_SKIP_EXTERNAL=yes -v $PWD:/github/workspace htmltest-action
if [ "$?" -ne "0" ]; then echo "❌❌❌ FAIL ❌❌❌"; exit 1; fi

echo "✅✅✅ PASS ✅✅✅"
exit 0
