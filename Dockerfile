FROM nginx

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y wget && \
    wget https://github.com/VixiaID/mur/raw/main/myurls.tar.gz && \
    tar -zxvf myurls.tar.gz && \
    chmod +x /myurls/linux-amd64-myurls.service && \
    rm -rf /myurls.tar.gz 

ADD nginx.conf /etc/nginx/nginx.conf
ADD myurls.sh /myurls/myurls.sh
RUN chmod +x /myurls/myurls.sh
EXPOSE 80
WORKDIR /myurls
ENTRYPOINT ["./myurls.sh"]
