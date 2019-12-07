#!/bin/bash

while getopts s opt
do
  case "${opt}" in
  s) CURLARG=-s;;
  [?]) echo "Usage: $0 [-s]\n\t-s | Compile shared curl library (*.so)"
       exit 1;;
  esac
done

if [[ -z "${ANDROID_NDK_HOME}" ]]; then
echo "ERROR: 'ANDROID_NDK_HOME' not set"
exit 1
elif [[ -z "${HOST_TAG}" ]]; then
echo "ERROR: 'HOST_TAG' not set"
exit 1
elif [[ -z "${MIN_SDK_VERSION}" ]]; then
echo "ERROR: 'MIN_SDK_VERSION' not set"
exit 1
fi

chmod +x ./build-openssl.sh
chmod +x ./build-curl.sh

./build-openssl.sh
./build-curl.sh $CURLARG
