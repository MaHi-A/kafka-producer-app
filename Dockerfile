FROM ruby:2.6.0
RUN apt-get update -qq && apt-get install -y build-essential nodejs

ENV APP_HOME /kafka-producer-app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile /kafka-producer-app/Gemfile
COPY Gemfile.lock /kafka-producer-app/Gemfile.lock
RUN bundle install
COPY . /kafka-producer-app
