FROM jekyll/jekyll:pages

RUN apk --no-cache add git

COPY run.sh . && \
     chmod +x run.sh

EXPOSE 35729
EXPOSE 4000


CMD ["/bin/bash", "-c", "run.sh"]
