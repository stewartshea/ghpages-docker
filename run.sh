#!/bin/bash
apk --no-cache add git
rm -rf /srv/jekyll/* 
git clone https://$GIT_TOKEN@$GIT_URL /srv/jekyll
cd /srv/jekyll
jekyll serve
