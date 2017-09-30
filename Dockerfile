FROM jekyll/jekyll:pages

RUN apk --no-cache add git



ENV APP_ROOT=/jekyll/srv
ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}
COPY bin/ ${APP_ROOT}/bin/
RUN chmod -R u+x ${APP_ROOT}/bin && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd && \
    usermod -u 1000001 jekyll && \
    usermod -d ${APP_ROOT} jekyll && \
    usermod -aG 0 jekyll && \
    chown -R jekyll:jekyll /jekyll


EXPOSE 35729
EXPOSE 4000

USER 1000001
WORKDIR ${APP_ROOT}

CMD ["/bin/bash", "-c", "${APP_ROOT}/bin/run.sh"]
