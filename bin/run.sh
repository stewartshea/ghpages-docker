#!/bin/bash
#if ! whoami &> /dev/null; then
#  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-jekyll}:x:$(id -u):0:${USER_NAME:-jekyll} user:${APP_ROOT}:/sbin/nologin" >> /etc/passwd
#  fi
#fi
#exec "$@"

git clone -b $BRANCH https://$GIT_TOKEN@$GIT_URL ${APP_ROOT}/site
cd ${APP_ROOT}/site
jekyll serve
