FROM jekyll/jekyll:pages

RUN apk --no-cache add git



ENV APP_ROOT=/jekyll/srv
ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}
COPY bin/ ${APP_ROOT}/bin/

## Need to clean up permissions as a result of troubleshooting
RUN chmod -R u+x ${APP_ROOT}/bin && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd && \
    usermod -u 1000001 jekyll && \
    usermod -d ${APP_ROOT} jekyll && \
    usermod -aG 0 jekyll && \
    groupmod -g 1000001 jekyll && \
    chown -R jekyll:jekyll /jekyll && \
    find / -group 1000 -exec chgrp -h jekyll {} \; && \
    find / -user 1000 -exec chown -h jekyll {} \;


EXPOSE 35729
EXPOSE 4000

USER 1000001
WORKDIR ${APP_ROOT}
VOLUME ${APP_ROOT}

CMD ["/bin/bash", "-c", "${APP_ROOT}/bin/run.sh"]
