#!/bin/bash
. /dcos-cli/credstash.sh
/bin/bash /dcos-cli/config.sh
dcos-cli/bin/dcos "$@"
