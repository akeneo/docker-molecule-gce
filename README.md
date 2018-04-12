# Akeneo Ansible Dockerfile

[![Build Status](https://travis-ci.org/akeneo/docker-molecule-gce.svg?branch=master)](https://travis-ci.org/akeneo/docker-molecule-gce)

This repository contains the Molecule GCE Dockerfile to be used for development/testing. Please do not use them for a production environment. Feel free to use/adapt them for your needs

## How to use this image

If you are new to Docker, please start with the [getting started section](https://github.com/akeneo/Dockerfiles/blob/master/Docs/getting-started.md).
And even if you are not new, it is a good start to understand how these images are intended to be used.

To know how to add tests, please read [this documentation](https://github.com/akeneo/Dockerfiles/blob/master/Docs/testing.md).

If you want to benefit from this image you have to use the container like this:

```bash
docker run -it -d \
    -v your-ssh-key:/root/.ssh/id_rsa \
    -v your-ssh-key.pub:/root/.ssh/id_rsa.pub \
    -v your-ansible-playbooks:a-path \
    -v your-gcloud-credentials-file:a-path \
    -e GCE_PROJECT_ID='your-project-id' \
    -e GCE_SERVICE_ACCOUNT_EMAIL='your-service-account-id' \
    -e GCE_CREDENTIALS_FILE='path-to-your-credentials' \
    --name molecule akeneo/ansible-molecule-gce:2.12
```

## License

This content of this repository is under the MIT license. See the complete license in the [LICENSE](https://github.com/akeneo/docker-molecule-gce/blob/master/LICENSE) file.