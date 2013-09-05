#!/bin/sh
PATH="/opt/bitnami/memcached/bin:/opt/bitnami/perl/bin:/opt/bitnami/git/bin:/opt/bitnami/nginx/sbin:/opt/bitnami/redis/bin:/opt/bitnami/sphinx/bin:/opt/bitnami/sqlite/bin:/opt/bitnami/varnish/bin:/opt/bitnami/php/bin:/opt/bitnami/mysql/bin:/opt/bitnami/apache2/bin:/opt/bitnami/subversion/bin:/opt/bitnami/ruby/bin:/opt/bitnami/common/bin:$PATH"
export PATH
if [ -x "/home/bitnami/change-password.sh" ]; then
/home/bitnami/change-password.sh
fi

if [[ -s /opt/bitnami/.bitnamirc ]]; then
source /opt/bitnami/.bitnamirc
fi

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;32m\] '
