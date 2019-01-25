FROM jenkins/jenkins:lts

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN curl -L https://aka.ms/InstallAzureCli | bash

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

