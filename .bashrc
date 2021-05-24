set -o vi
eval "$(direnv hook bash)"

alias fd=fdfind

alias msql="MYSQL_PWD=1 mysql -h localhost -P 3306 --protocol=tcp -u root"
alias gk="gitk --all"
alias gitk="gitk --all"
alias gcount="git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"
alias ntl="nautilus ."
alias mkr='make run 2>&1 > /dev/null | jq -r ".,.stacktrace"'
alias gf="git fetch -p"
