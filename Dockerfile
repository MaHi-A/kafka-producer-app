FROM ruby:2.6.0
RUN apt-get update -qq && apt-get install -y build-essential nodejs

ENV APP_HOME /sample-kafka-app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile /sample-kafka-app/Gemfile
COPY Gemfile.lock /sample-kafka-app/Gemfile.lock
RUN bundle install
COPY . /sample-kafka-app
