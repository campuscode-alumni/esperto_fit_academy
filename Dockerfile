FROM ruby:2.6.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /espertofit_academy
WORKDIR /espertofit_academy
COPY Gemfile* /espertofit_academy/
RUN bundle install
COPY . /espertofit_academy

CMD ["rails", "server", "-b", "0.0.0.0"]
