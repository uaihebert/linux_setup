alias dops='docker ps'
alias doi='docker images'
alias dob='docker build . -t'
alias dop='docker push'
alias dorm='docker rmi'
alias dcau='docker-compose -f docker-compose.local.yml up -d'
alias dcal='docker-compose -f docker-compose.local.yml logs'
alias dos='docker stop'

alias k8='kubectl'
alias k8g='kubectl get'
alias k8d='kubectl describe'


stopAndClean() {
  docker stop "$1" || true;
  docker rm "$1" || true;
}

alias d_pg="startDockerCompose pg docker_pg.yml"
alias d_mo="startDockerCompose mongo docker_mongo.yml"

alias d_es='(stopAndClean "es") && docker run --mount src=/Users/hebertcoelhodeoliveira/dev/workspace/es_shared_docker,target=/shared_data,type=bind -d -p 5601:5601 -p 5044:5044 -p 9200:9200 -p 9300:9300 -e "xpack.security.enabled=false"  -e "transport.host=0.0.0.0" -e "discovery.zen.minimum_master_nodes=1" --name es docker.elastic.co/elasticsearch/elasticsearch:5.5.2'
alias d_elk='(stopAndClean "elk") && docker run --mount src=/Users/hebertcoelhodeoliveira/dev/workspace/es_shared_docker,target=/shared_data,type=bind -d -p 5601:5601 -p 5044:5044 -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "transport.host=0.0.0.0" -e "discovery.zen.minimum_master_nodes=1" --name elk sebp/elk'
alias d_re='docker run -p 6379:6379 redis'

startDockerCompose() {
  docker-compose -f ${DEV_WORKSPACE}/uai/linux_setup/$2 up -d 
}

alias docker_delete_all_images='docker rm -f $(docker ps -a -q) && docker rmi -f $(docker images -q)'
alias docker_delete_all_untagged_images='(docker rm $(docker ps -a -q)  || true) && docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'

alias d_nginx_restart='(docker stop nginx || true) && (docker rm nginx || true) && docker run --name nginx -v ~/nginx:/etc/nginx/conf.d:cached -p 80:80 -p 7000:7000 -d nginx'

