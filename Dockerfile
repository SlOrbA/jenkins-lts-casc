FROM jenkins/jenkins:lts

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN curl -L https://aka.ms/InstallAzureCliBundled -o azure-cli_bundle.tar.gz

RUN tar -xvzf azure-cli_bundle.tar.gz

RUN azure-cli_bundle_*/installer

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

