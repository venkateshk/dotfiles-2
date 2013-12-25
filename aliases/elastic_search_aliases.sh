function start_elasticsearch {
  echo "elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"
  elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml
}

