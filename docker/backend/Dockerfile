FROM ruby:3.0.0-alpine

ARG RAILS_ENV

ENV RACK_ENV=$RAILS_ENV

RUN apk add --update build-base nodejs tzdata libxslt-dev libxml2-dev sqlite-dev

WORKDIR app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

RUN if [[ "$RAILS_ENV" == "production" ]]; then bundle install --without development test; else bundle install; fi

COPY ./app/assets ./app/assets
COPY ./public ./public

RUN rails assets:precompile

COPY . ./
