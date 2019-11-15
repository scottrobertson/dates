FROM ruby:2.6.5-alpine
WORKDIR /app

RUN apk update
RUN apk add yarn git build-base postgresql-dev

ADD Gemfile* /app/
RUN bundle install --jobs 4 --retry 1 --without development test

ADD . /app

RUN bundle exec rake assets:precompile && rake stats
