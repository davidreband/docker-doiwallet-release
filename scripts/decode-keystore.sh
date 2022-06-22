#!/bin/bash

apt-get update     
apt-get install -y locales locales-all  
git clone -b $BRANCH --single-branch https://github.com/davidreband/DoiWallet.git 

cd DoiWallet  
yarn install 
yarn add @keystonehq/bc-ur-registry 
cd android
gem install bundler
bundle install 
gem install fastlane
bundle update fastlane

echo $KEYSTORE_BASE64  | base64 --decode > /home/DoiWallet/android/app/upload-keystore.jks
echo "keystore written"

echo $JSON_KEY_FILE  | base64 --decode > /home/DoiWallet/android/keystores/pc-api-7544041306212151668-842-081c5b393ff8.json 
echo "google account credentials written"  
echo $RELEASE_KEYSTORE_PROPERTIES | base64 --decode > /home/DoiWallet/android/keystores/release.keystore.properties
echo "keystore properties written"

#fastlane add_plugin increment_version_code
#fastlane increment_vc
#fastlane run increment_build_number
#fastlane add_plugin increment_version_code
bundle exec fastlane increment_vc
echo "increment version code"
bundle exec fastlane beta
echo "bundle generation"