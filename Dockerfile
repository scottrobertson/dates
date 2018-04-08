FROM ruby:2.4.0
WORKDIR /app

RUN apt-get update -qq && apt-get install -y build-essential libxml2-dev libxslt1-dev nodejs

ADD Gemfile* /app/
RUN bundle install

ADD . /app

RUN bundle exec rake assets:precompile && rake stats
