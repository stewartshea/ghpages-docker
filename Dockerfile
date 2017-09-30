FROM jekyll/jekyll:pages

RUN apk --no-cache add git

WORKDIR /srv/jekyll
VOLUME /srv/jekyll
COPY run.sh .
RUN chmod +x run.sh

EXPOSE 35729
EXPOSE 4000


CMD ["./run.sh"]
