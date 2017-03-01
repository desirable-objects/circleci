# circleci
Base nodejs build image for CircleCI 2.0

## Background

This image is designed to be used for CirlceCI 2.0, in order to provide the fastest feedback loop possible.
It is optimised for the absolute minimum dependency tree for NodeJS builds, and should therefore be useful for most cases,
but you can extend it in the usual way should you need to add some extra dependencies/functionality.

```
FROM desirableobjects/circleci

RUN <some-other-cmd>
```

This baseline image for CircleCI 2.0 gives you:

- Authorised git checkout
- Yarn for package installation
- Latest NodeJS
- Latest Alpine for speed

A build using this image looks something like:

```yaml
version: 2 # Only works with CircleCI 2.0
executorType: docker
containerInfo:
  - image: desirableobjects/circleci
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
