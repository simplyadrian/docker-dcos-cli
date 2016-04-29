#!/bin/bash

TOKEN=${TOKEN:-'1234'}

cat <<EOF > /dcos-cli/.dcos/dcos.toml
[core]
ssl_verify = "false"
dcos_url = "${DCOS_URL}"
dcos_acs_token = "${TOKEN}"
EOF
