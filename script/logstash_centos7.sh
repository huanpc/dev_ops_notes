

REPO="[logstash-2.2]
name=logstash repository for 2.2 packages
baseurl=http://packages.elasticsearch.org/logstash/2.2/centos
gpgcheck=1
gpgkey=http://packages.elasticsearch.org/GPG-KEY-elasticsearch
enabled=1"

sudo echo $REPO >> /etc/yum.repos.d/logstash.repo

sudo yum -y install logstash

FILE_BEAT_INPUT="input {
  beats {
    port => 5044
    ssl => true
    ssl_certificate => "/etc/pki/tls/certs/logstash-forwarder.crt"
    ssl_key => "/etc/pki/tls/private/logstash-forwarder.key"
  }
}"

sudo echo $REPO >> /etc/logstash/conf.d/02-beats-input.conf