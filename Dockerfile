
FROM doichain/docker-android

#Install doiwallet
WORKDIR /home

#RUN apt-get update && \     
#    apt-get install -y locales locales-all && \ 
#    git clone https://github.com/davidreband/DoiWallet.git 

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ENV KEYSTORE_BASE64 ""
ENV RELEASE_KEYSTORE_PROPERTIES ""
ENV JSON_KEY_FILE ""
ENV BRANCH ""
ENV API_TOKEN ""
ENV GITUSERMAIL ""
ENV GITUSERNAME ""



COPY scripts/decode-keystore.sh .

CMD ["/home/decode-keystore.sh"]




    
    


