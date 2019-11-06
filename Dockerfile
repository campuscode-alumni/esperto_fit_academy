FROM ruby:2.6.4
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /espertofit_academy
RUN apt-get install rsyslog  -y
WORKDIR /espertofit_academy
ADD Gemfile /espertofit_academy/Gemfile
ADD Gemfile.lock /espertofit_academy/Gemfile.lock
RUN bundle install
RUN /etc/init.d/rsyslog start
