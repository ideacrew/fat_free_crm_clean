########################
### app/rails config ###
########################

FROM ruby:2.6.5 AS app

LABEL author="Ideacrew"

ENV HOME /covid_most

RUN mkdir -p $HOME

WORKDIR $HOME

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Configure bundler and PATH
ENV LANG=C.UTF-8 \
    GEM_HOME=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /covid_most/bin:$BUNDLE_BIN:$PATH

RUN apt-get update && \
    apt-get -yq dist-upgrade && \
    apt-get install -y imagemagick tzdata build-essential nodejs vim && \
    apt-get autoremove -y && \ 
    gem install bundler:2.1.2 && \
    npm install --global yarn 

# Setting env up
ENV RAILS_ENV='production'
ENV NODE_ENV='production'

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install --jobs 20 --retry 5 --without development test 

COPY . .

ARG DB_DATABASE
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_HOST

RUN export DB_DATABASE=$DB_DATABASE && \
    export DB_USERNAME=$DB_USERNAME && \
    export DB_PASSWORD=$DB_PASSWORD && \
    export DB_HOST=$DB_HOST && \
    bundle exec rake assets:precompile && \
    unset DB_DATABASE && \
    unset DB_USERNAME && \
    unset DB_PASSWORD && \
    unset DB_HOST

RUN rm -f /app/config/master.key && rm -f /app/config/credentials.yml.enc


########################
### web/nginx config ###
######################## 

FROM nginx:1.17.6-alpine as web

RUN mkdir /covid_most

# copy assets from the app build and nginx config
COPY --from=app /covid_most/public /covid_most/
COPY .docker/production/nginx.conf /etc/nginx/conf.d/covid_most.conf
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf-bkp

