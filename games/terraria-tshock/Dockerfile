FROM phusion/baseimage:0.9.16

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update -y
RUN apt-get install -yq mono-complete unzip

RUN mkdir -p /opt/terraria/
ADD https://github.com/NyxStudios/TShock/releases/download/v4.3.5/tshock_4.3.5-release.zip /tmp/tshock.zip
RUN unzip -d /opt/terraria /tmp/tshock.zip

ADD start-service /etc/service/terraria/run

VOLUME ["/opt/terraria/worlds", "/opt/terraria/logs", "/opt/terraria/config"]

RUN useradd terraria -u 7777
RUN chown terraria: -R /opt/terraria/


CMD ["/sbin/my_init"]

EXPOSE 7777
