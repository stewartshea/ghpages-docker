#!/bin/bash

git clone -b $BRANCH https://$GIT_TOKEN@$GIT_URL ${APP_ROOT}/site
cd ${APP_ROOT}/site
$GEM_HOME/bin/jekyll serve
