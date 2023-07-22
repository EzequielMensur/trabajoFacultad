FROM ubuntu:22.04

RUN apt-get update && apt-get install --no-install-recommends -y
RUN apt-get install -y imagemagick
RUN apt-get install -y wget
RUN apt-get install -y whiptail
RUN apt-get clean 
RUN apt-get update && apt-get install -y \
    apache2 \
    html2ps \
    curl
RUN sed -i 's/rights="none" pattern="PS"/rights="read | write" pattern="PS"/g' /etc/ImageMagick-6/policy.xml

WORKDIR /
COPY . .

VOLUME /edit

RUN chmod +x app/scripts/* app/utils/*

CMD ["bash","app/scripts/menu.sh"]


                                                                                                                                                                                                                                                                                                                                                                                                                       
