FROM ruby:2.6.4

RUN apt-get update

RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_12.x 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get install -y postgresql-client 

RUN mkdir /espertofit_academy
WORKDIR /espertofit_academy
COPY Gemfile* /espertofit_academy/

RUN bundle install

COPY . /espertofit_academy

RUN export LC_ALL=C.UTF-8
RUN export LANG=en_US.UTF-8
RUN export LANGUAGE=en_US.UTF-8

CMD ["rails", "server", "-b", "0.0.0.0"]
