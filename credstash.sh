if [[ -n "$DCOS_TOKEN" ]] && [[ -n "$ENVIRON" ]] && [[ -n "$CREDSTASH_TABLE" ]] && [[ -n "$CREDSTASH_REGION" ]]
then
  DCOS_CLI_TOKEN=$(credstash -r $CREDSTASH_REGION -t $CREDSTASH_TABLE get -n $DCOS_TOKEN env=$ENVIRON)
  sed -i.bak "s/1234/$DCOS_CLI_TOKEN/g" /dcos-cli/config.sh
fi
