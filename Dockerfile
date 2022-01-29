FROM debian:10
RUN echo 'deb http://deb.debian.org/debian stretch-backports main' >> /etc/apt/sources.list
WORKDIR ./app 
RUN apt-get update -y && apt-get install -y git curl sed
#RUN mkdir app   
COPY . /app
VOLUME ["/root/Desktop"]
ENTRYPOINT ["/bin/bash", "./script.sh"]
