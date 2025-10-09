FROM alpine:3.22 

RUN --mount=type=cache,sharing=locked,target=/var/cache/apk/ \
    apk update &&\
    apk add build-base ruby ruby-dev

RUN gem install jekyll bundler &&\
    echo -e "bundle install\nbundle exec jekyll serve --host 0.0.0.0 --port 443 --force_polling --livereload --livereload-port 35729" > /start.sh &&\
    chmod +x /start.sh

WORKDIR /www
ENTRYPOINT ["sh"]
CMD [ "/start.sh" ]