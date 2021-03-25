#!/bin/bash

if [ -z "$testingbot_key" ]; then
  echo "Please provide your TestingBot Key"
  exit 1
fi

if [ -z "$testingbot_secret" ]; then
  echo "Please provide your TestingBot Secret"
  exit 1
fi

if [ -z "$apk_ipa_filepath" ]; then
  echo "Please provide the path for the IPA or APK that you wish to upload."
  echo "For IPA it is usually \$BITRISE_IPA_PATH"
  echo "For APK it is usually \$BITRISE_APK_PATH"
  exit 1
fi

curl -u "$testingbot_key:$testingbot_secret" -X POST https://api.testingbot.com/v1/storage -F "file=@$apk_ipa_filepath"