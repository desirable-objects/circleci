FROM node:alpine

RUN apk -U add git curl tar openssh
RUN curl -o- -L https://yarnpkg.com/install.sh | /bin/sh
ENV PATH "$HOME/.yarn/bin:$PATH"