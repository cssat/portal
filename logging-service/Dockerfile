FROM alpine:3.16
LABEL maintainer "Fluentd developers <fluentd@googlegroups.com>"
LABEL Description="Fluentd docker image" Vendor="Fluent Organization" Version="1.15.3"

# Do not split this into multiple RUN!
# Docker creates a layer for every RUN-Statement
# therefore an 'apk delete' has no effect
RUN apk update \
 && apk add --no-cache \
        ca-certificates \
        ruby ruby-irb ruby-etc ruby-webrick \
        tini \
 && apk add --no-cache --virtual .build-deps \
        build-base linux-headers \
        ruby-dev gnupg \
 && echo 'gem: --no-document' >> /etc/gemrc \
 && gem install oj -v 3.13.22 \
 && gem install json -v 2.6.2 \
 && gem install rexml -v 3.2.5 \
 && gem install async -v 1.30.3 \
 && gem install async-http -v 0.56.6 \
 && gem install fluentd -v 1.15.3 \
 && gem install bigdecimal -v 1.4.4 \
 && gem install fluent-plugin-s3 --no-document \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem /usr/lib/ruby/gems/3.*/gems/fluentd-*/test

RUN addgroup -S fluent && adduser -S -G fluent fluent \
    # for log storage (maybe shared with host)
    && mkdir -p /fluentd/log \
    # configuration/plugins path (default: copied from .)
    && mkdir -p /fluentd/etc /fluentd/plugins \
    && chown -R fluent /fluentd && chgrp -R fluent /fluentd


COPY fluent.conf /fluentd/etc/
COPY docker_log.avsc /fluentd/avsc/
COPY entrypoint.sh /bin/
RUN chmod 777 /bin//entrypoint.sh


ENV FLUENTD_CONF="fluent.conf"

ENV LD_PRELOAD=""
EXPOSE 24224/tcp

USER fluent
ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]

# FROM alpine:3.15.0

# LABEL MAINTAINER="Joseph MIENKO <mienko@uw.edu>"
# LABEL APP="fluentd"
# LABEL APP_VERSION="1.15.1"
# LABEL APP_REPOSITORY="https://github.com/fluent/fluentd/releases"

# ENV TIMEZONE Pacific Standard Time
# ENV FLUENTD_VERSION 1.15.1

# # Installing dependencies
# RUN apk --update add --no-cache ruby ruby-irb su-exec
# RUN apk --update add --no-cache --virtual .build-deps build-base ruby-dev

# # Creating user Fluentd
# RUN addgroup fluentd && \
#         adduser -s /bin/false -G fluentd -S -D fluentd

# # Installing Fluentd + plugins S3 & ES
# RUN echo 'gem: --no-document' >> /etc/gemrc && \ 
#         gem install oj && \
#         gem install json && \
#         gem install fluentd -v ${FLUENTD_VERSION} && \
#         gem install fluent-plugin-s3 && \
#         apk del .build-deps

# # Coping config & scripts
# COPY ./in_docker.conf /etc/fluentd/in_docker.conf
# COPY ./start.sh start.sh
# RUN chmod +x start.sh

# EXPOSE 24224 24224/udp

# USER fluentd

# ENTRYPOINT [ "./start.sh" ]


# COPY fluent.conf /fluentd/etc/
# COPY entrypoint.sh /bin/


# ENV FLUENTD_CONF="fluent.conf"

# ENV LD_PRELOAD=""
# EXPOSE 24224 5140

# USER fluent
# ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
# CMD ["fluentd"]

# FROM fluent/fluentd:latest

# RUN apk update
# RUN apk add --upgrade chrony

# RUN ulimit -n

# USER root

# WORKDIR /home/fluent
# ENV PATH /home/fluent/.gem/ruby/2.4.0/bin:$PATH
# ENV APK_ADD=".build-deps sudo build-base ruby-dev"
# ENV APK_DEL=".build-deps sudo build-base ruby-dev"

# ARG GEM_S3_VERSION="-v 1.1.4"
# ARG GEM_S3_NAME="fluent-plugin-s3"
# RUN apk add --update --no-cache --virtual $APK_ADD && \
#   sudo gem install "${GEM_S3_NAME}" ${GEM_S3_VERSION} && \
#   sudo gem sources --clear-all && \
#   apk del ${APK_DEL} && rm -rf /var/cache/apk/* \
#     /home/fluent/.gem/ruby/2.4.0/cache/*.gem

# RUN deluser --remove-home postmaster \
#   && deluser --remove-home cyrus \
#   && deluser --remove-home mail \
#   && deluser --remove-home news \
#   && deluser --remove-home uucp \
#   && deluser --remove-home operator \
#   && deluser --remove-home man \
#   && deluser --remove-home cron \
#   && deluser --remove-home ftp \
#   && deluser --remove-home sshd \
#   && deluser --remove-home at \
#   && deluser --remove-home squid \
#   && deluser --remove-home xfs \
#   && deluser --remove-home games \
#   && deluser --remove-home postgres \
#   && deluser --remove-home vpopmail \
#   && deluser --remove-home ntp \
#   && deluser --remove-home smmsp \
#   && deluser --remove-home guest

# COPY ./version-info /usr/bin

# RUN addgroup -S fluent && adduser -S -G fluent fluent \
#     # for log storage (maybe shared with host)
#     && mkdir -p /fluentd/log \
#     # configuration/plugins path (default: copied from .)
#     && mkdir -p /fluentd/etc /fluentd/plugins \
#     && chown -R fluent /fluentd && chgrp -R fluent /fluentd

# COPY fluent.conf.erb /fluentd/etc/
# #COPY entrypoint.sh /bin/
# RUN mkdir -p /fluentd/avsc
# COPY docker_log.avsc /fluentd/avsc/
# RUN chown -R fluent /fluentd
# RUN chmod u+s /fluentd/etc/fluent.conf.erb
# RUN chmod a+x /fluentd/etc/fluent.conf.erb

# ENV FLUENTD_CONF="fluent.conf.erb"

# USER fluent

# EXPOSE 24224

# CMD ["bundle", "install", "fluentd", "--setup", "./fluent", "fluentd", "-c", "/fluentd/etc/fluent.conf.erb", "-vv"]