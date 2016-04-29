#!/bin/bash
pushd dcos-cli
curl -O https://downloads.mesosphere.io/dcos-cli/install.sh
bash install.sh . "${DCOS_URL}" --add-path yes
popd
