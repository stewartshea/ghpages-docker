#!/bin/bash
git clone https://$GIT_TOKEN@$GIT_URL ${APP_ROOT}/site
cd ${APP_ROOT}/site
jekyll serve
