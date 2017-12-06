alias dops='docker ps'
alias doi='docker images'
alias dob='docker build . -t'
alias dop='docker push'
alias dorm='docker rmi'
alias dcau='docker-compose -f docker-compose.local.yml up -d'
alias dcal='docker-compose -f docker-compose.local.yml logs'
alias dcap='docker-compose -f docker-compose.local.yml ps'
alias dost='docker stop'

alias es_start='es_stop || true && docker run -d --name henry-es -p 9200:9200 -p 9300:9300 elasticsearch:5.5 -Etransport.host=0.0.0.0 -Ediscovery.zen.minimum_master_nodes=1'
alias es_stop='docker stop henry-es && docker rm henry-es'

# Postgre
alias pg_vol_create="docker create -v /var/lib/postgresql/data --name postgres9.6.5-data busybox"
alias pg_vol_remove="docker rm -v postgres9.6.5-data"

alias pg_start="docker run --name local-postgres9.6.5 -p 5432:5432 -e POSTGRES_PASSWORD=asecurepassword -d --volumes-from postgres9.6.5-data postgres:9.6.5"
alias pg_stop="docker stop local-postgres9.6.5 && pg_remove"
alias pg_remove="docker rm -v local-postgres9.6.5"
alias psql="run_psql"
alias pg_bash="docker exec -it local-postgres9.6.5 bash"

function run_psql {
docker run -it --link local-postgres9.6.5:postgres --rm postgres:9.6.5 sh -c 'PGPASSWORD=asecurepassword exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'
}

# MariaDB
alias maria_vol_create="docker create -v /var/lib/mariadb/data --name mariadb_volume mariadb"
alias maria_start="maria_stop || true && docker run --name mariadb_server -d -p 3306:3306 --volumes-from mariadb_volume -e MYSQL_ROOT_PASSWORD=secret mariadb"
alias mariadb="run_mariadb"
alias maria_stop="docker stop mariadb_server && docker rm -v mariadb_server"
alias maria_bash="docker exec -it mariadb_server bash"

function run_mariadb {
docker run -it --link mariadb_server:mysql --rm mariadb sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
}

# Mongo
alias mongo_vol_create="docker create -v /var/lib/mongo/data --name mongo-data mongo"
alias mongo_start="mongo_stop || true && docker run --name mongo_db -d -p 27017:27017 -d --volumes-from mongo-data mongo"
alias mongo_stop="docker stop mongo_db && docker rm -v mongo_db"
alias mongo="docker exec -i -t mongo_db mongo"
alias mongo_bash="docker exec -it maria_db bash"
