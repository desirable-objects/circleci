FROM node:alpine

RUN apk -U add git curl tar
RUN curl -o- -L https://yarnpkg.com/install.sh | /bin/sh
ENV PATH "$HOME/.yarn/bin:$PATH"