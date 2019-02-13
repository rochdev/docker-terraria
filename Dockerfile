FROM ubuntu:14.04.4

RUN apt-get update && apt-get install -y unzip

ENV TERRARIA_VERSION=1352 TERRARIA_ZIP=terraria-server.zip TMODLOADER_VERSION=v0.10.1.5 TMODLOADER_ZIP=tmodloader.zip CONFIG=Linux/serverconfig.txt

WORKDIR /opt/terraria

ADD http://terraria.org/server/terraria-server-${TERRARIA_VERSION}.zip ${TERRARIA_ZIP}

RUN unzip $TERRARIA_ZIP 'Linux/*' \
  && rm $TERRARIA_ZIP

ADD https://github.com/blushiemagic/tModLoader/releases/download/${TMODLOADER_VERSION}/tModLoader.Linux.${TMODLOADER_VERSION}.zip ${TMODLOADER_ZIP}

RUN unzip $TMODLOADER_ZIP -d Linux/ \
  && rm $TMODLOADER_ZIP \
  && chmod -R a+rw ./Linux/* \
  && chmod a+x ./Linux/TerrariaServer* \
  && chmod a+x ./Linux/tModLoaderServer*

EXPOSE 7777

ENTRYPOINT ./Linux/tModLoaderServer -x64 -config $CONFIG
