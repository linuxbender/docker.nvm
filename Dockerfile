FROM ubuntu:latest

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

MAINTAINER linuxbender <linuxbender@gmail.com>

ENV NVM_DIR /.nvm

RUN apt-get update && apt-get install -y curl python && apt-get autoremove -y

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

ENV PATH $HOME/$NVM_DIR:$PATH

RUN ["/bin/bash","-c","source ~/.bashrc"]

RUN . $NVM_DIR/nvm.sh \
	&& nvm install stable \
	&& nvm use stable \
	&& nvm alias default stable \
	&& npm install -g gulp bower grunt-cli mocha chai sinon typescript

EXPOSE 4242

ENTRYPOINT ["bash"]
