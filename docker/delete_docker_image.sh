docker image prune -a --filter "until=$(date +'%Y-%m-%dT%H:%M:%S' --date='-15 days')"
