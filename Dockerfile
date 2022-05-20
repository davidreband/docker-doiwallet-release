
FROM doichain/docker-android

#Install doiwallet
WORKDIR /home

RUN apt-get update && \     
    apt-get install -y locales locales-all && \ 
    git clone https://github.com/davidreband/DoiWallet.git 

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
    

COPY keystore_files/upload-keystore.jks ./DoiWallet/android/app/ 
COPY keystore_files/pc-api-7544041306212151668-842-081c5b393ff8.json ./DoiWallet/android/keystores/ 
COPY keystore_files/release.keystore.properties ./DoiWallet/android/keystores/ 

RUN cd DoiWallet && \
    yarn install && \
    yarn add @keystonehq/bc-ur-registry && \
    cd android && \
    #gem install bundler && \
    bundle install && \
    gem install fastlane  && \
    bundle update fastlane && \
    #&& \
    bundle exec fastlane beta

    #./gradlew clean && \
    #./gradlew bundleRelease 



 #   echo $ENV_KEYSTORE_BASE64  | base64 --decode > DoiWallet/android/app/upload-keystore.jks 
    


