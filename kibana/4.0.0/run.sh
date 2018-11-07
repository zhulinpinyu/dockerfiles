#!/bin/sh

set -e

KIBANA_ES_URL=${KIBANA_ES_URL:-http://localhost:9200}
KIBANA_INDEX=${KIBANA_INDEX:-kibana-init}

sed -i "s;^elasticsearch_url:.*;elasticsearch_url: ${KIBANA_ES_URL};" "/kibana/config/kibana.yml"
sed -i "s;^kibana_index:.*;kibana_index: ${KIBANA_INDEX};" "/kibana/config/kibana.yml"

unset HOST
unset PORT

exec /kibana/bin/kibana