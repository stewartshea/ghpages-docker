FROM jekyll/jekyll:pages

RUN apk --no-cache add git


# install gitbook versions
RUN cd /srv/jekyll \
    git clone $GIT_URL .



EXPOSE 35729
EXPOSE 4000


CMD ["jekyll", "serve"]
