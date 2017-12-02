# docker-alpine-gitftp
Dockerfile to automatically build a lightweight Alpine Linux image including the newest git-ftp version. Created for Continuous Delivery through Bitbucket Pipelines.

## Docker Hub Image
This public Docker Hub image is automatically build upon a push on the master branch: <https://hub.docker.com/r/fgch/alpine-gitftp/>

### Usage
Reference the image in your bitbucket-pipelines.yml and add the appropriate git-ftp command, example:

```shell
image: fgch/alpine-gitftp

pipelines:
    default:
        - step:
            script:
                - git ftp -u FTP-USER -p FTP-PASSWORD FTP-SERVER-URL
```
