FROM ruby:2.6.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /espertofit_academy
WORKDIR /espertofit_academy
ADD Gemfile /espertofit_academy/Gemfile
ADD Gemfile.lock /espertofit_academy/Gemfile.lock
RUN bundle install
RUN rm tmp/pids/server.pid