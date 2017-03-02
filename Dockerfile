FROM node:alpine

RUN apk -U --no-cache add git curl tar openssh
RUN touch ~/.profile && curl -o- -L https://yarnpkg.com/install.sh | /bin/sh
ENV PATH "$HOME/.yarn/bin:$PATH"