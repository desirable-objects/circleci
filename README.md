[![Travis CI](https://api.travis-ci.org/desirable-objects/circleci.svg?branch=master)](https://travis-ci.org/desirable-objects/circleci)

# circleci
Base nodejs build image for CircleCI 2.0

## Background

This image is designed to be used for CirlceCI 2.0, in order to provide the fastest feedback loop possible.
It is optimised for the absolute minimum dependency tree for NodeJS builds, and should therefore be useful for most cases,
but you can extend it in the usual way should you need to add some extra dependencies/functionality.

```
FROM desirableobjects/circleci:latest

RUN <some-other-cmd>
```

This baseline image for CircleCI 2.0 gives you:

- Authorised git checkout
- Yarn for package installation
- Latest NodeJS
- Latest Alpine for speed

## Using :latest / :node-gyp

A build using this image looks something like:

```yaml
version: 2 # Only works with CircleCI 2.0
executorType: docker
containerInfo:
  - image: desirableobjects/circleci:latest
stages:
  build:
    workDir: ~/source
    steps:
      - type: add-ssh-keys # This is vital for building projects from private github repos 
      - type: checkout # This checks out your project
      - type: shell
        shell: /bin/sh
        command: yarn install # Install dependencies
      - type: shell
        shell: /bin/sh
        command: yarn run test # Run your tests
```

## Using :dind

You can use the dind image much the same as the above, but don't forget the critical `setup-docker-engine` step, before your docker commands:

```yaml
  ...

  - type: setup-docker-engine

  - type: deploy
    shell: /bin/sh
    command: |
      docker login -u $DOCKER_USERNAME -p $DOCKER_PASS
      docker build --rm=false -t your/docker-image .
      docker push your/docker-image
```

# Alternate images

All images use alpine. Tag variants are:

- `:latest` - Latest generic, includes npm, node-gyp, essential build tools, and yarn
- `:dind` - "Docker in Docker" Includes everything from `:latest`, but also has docker inside it, useful for building and publishing docker images.
