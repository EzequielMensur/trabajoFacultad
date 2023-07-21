FROM ubunto:22.04

RUN apt-get update && apt-get install --no-install-recommends -y
RUN apt-get install -y imagemagick
RUN apt-get install -y wget
RUN apt-get install -y whiptail
RUN apt-get clean 

WORKDIR /
COPY ./app .

VOLUME /edit

RUN chmod +x app/scripts/* app/utils/*
CMD["bash","./app/scripts/menu.sh"]


                                                                                                                                                                                                                                                                                                                                                                                                                       
