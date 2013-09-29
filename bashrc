#!/bin/sh
PATH="/opt/bitnami/memcached/bin:/opt/bitnami/perl/bin:/opt/bitnami/git/bin:/opt/bitnami/nginx/sbin:/opt/bitnami/redis/bin:/opt/bitnami/sphinx/bin:/opt/bitnami/sqlite/bin:/opt/bitnami/varnish/bin:/opt/bitnami/php/bin:/opt/bitnami/mysql/bin:/opt/bitnami/apache2/bin:/opt/bitnami/subversion/bin:/opt/bitnami/ruby/bin:/opt/bitnami/common/bin:$PATH"
export PATH
if [ -x "/home/bitnami/change-password.sh" ]; then
/home/bitnami/change-password.sh
fi

if [[ -s /opt/bitnami/.bitnamirc ]]; then
source /opt/bitnami/.bitnamirc
fi

#export TERM=xterm-256color

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[00m\]\$\[\e[m\] \[\e[1;32m\] '

# for colored root commandline:
# /root/.bashrc if no exist copy from /etc/skel
# uncomment force_color_prompt=yes
# change to folowing code: PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$\[\e[1;32m\] '
