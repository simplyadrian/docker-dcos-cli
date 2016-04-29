# DCOS CLI docker container

A simple Docker image based on [Alpine](https://registry.hub.docker.com/_/alpine/) used by [Apollo](https://github.com/Capgemini/Apollo) for running [Mesosphere DCOS command-line interface (CLI) to remotely manage your mesos cluster](https://docs.mesosphere.com/using/cli/).

## Usage

### Running DCOS CLI

See all available commands:

```bash
docker run -it -e DCOS_TOKEN=<secret_dcos_token_name> -e ENVIRON=<env> -e CREDSTASH_TABLE=<credential_store_table_name> -e CREDSTASH_REGION=<aws_region> dcos-cli
```

This image provides some values by default for your DCOS CLI config:

```bash
DCOS_CONFIG=/dcos-cli/.dcos/dcos.toml
DCOS_URL=${DCOS_URL:-'http://dev-dcos-master.mgage.com'}
TOKEN=${TOKEN:-'1234'}
```

You can override any value at run time as follows:

```bash
docker run -v `pwd`/chronos_config:/config \
           -e DCOS_URL='http://some.other.address.com' \
           -it dcos-cli package install --options=config --yes chronos
```

### Why?

This Docker image allows to run DCOS CLI commands from any server using automation provisioning tools like [Ansible](http://www.ansible.com/) with no necessity to install DCOS at runtime and without adding any dependency to our base images.
