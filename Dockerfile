FROM node:alpine

RUN apk -U --no-cache add git curl tar openssh make gcc g++ python bash
RUN touch ~/.profile && curl -o- -L https://yarnpkg.com/install.sh | /bin/sh
ENV PATH "$HOME/.yarn/bin:$PATH"

RUN yarn global add node-gyp