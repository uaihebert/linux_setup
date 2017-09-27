alias dops='docker ps'
alias dcau='docker-compose -f docker-compose.local.yml up -d'
alias dcal='docker-compose -f docker-compose.local.yml logs'
alias dcap='docker-compose -f docker-compose.local.yml ps'

# Postgre
alias pg_vol_create="docker create -v /var/lib/postgresql/data --name postgres9.6.5-data busybox"
alias pg_vol_remove="docker rm -v postgres9.6.5-data"

alias pg_start="docker run --name local-postgres9.6.5 -p 5432:5432 -e POSTGRES_PASSWORD=asecurepassword -d --volumes-from postgres9.6.5-data postgres:9.6.5"
alias pg_stop="docker stop local-postgres9.6.5 && pg_remove"
alias pg_remove="docker rm -v local-postgres9.6.5"
alias psql="run_psql"

function run_psql {
docker run -it --link local-postgres9.6.5:postgres --rm postgres:9.6.5 sh -c 'PGPASSWORD=asecurepassword exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'
}
