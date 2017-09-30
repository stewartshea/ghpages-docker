FROM jekyll/jekyll:pages

RUN apk --no-cache add git


# install gitbook versions
RUN git clone $GIT_URL site && \
    cd /srv/jekyll/site 



EXPOSE 35729
EXPOSE 4000


CMD ["jekyll", "serve"]
