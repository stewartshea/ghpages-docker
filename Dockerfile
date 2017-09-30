FROM jekyll/jekyll:pages

RUN apk --no-cache add git


# install gitbook versions
RUN rm -rf /srv/jekyll/* && \
    git clone https://$GIT_TOKEN@$GIT_URL /srv/jekyll


EXPOSE 35729
EXPOSE 4000


CMD ["jekyll", "serve", "--watch", "--drafts", "--incremental"]
