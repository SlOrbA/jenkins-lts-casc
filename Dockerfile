FROM jenkins/jenkins:lts

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

RUN apt-get install apt-transport-https lsb-release software-properties-common dirmngr -y

RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs)" > /etc/apt/sources.list.d/azure-cli.list

RUN apt-key --keyring /etc/apt/trsuted.gpg.d/Microsoft.gpg adv --keyserver packages.microsoft.com --recv-keys BC52868B50D79E339D3721CEB3E94ADBE1229CF

RUN apt-get update && apt-get install azure-cli -y
