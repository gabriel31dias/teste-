
FROM ruby:2.7.2
RUN  apt-get install libpq-dev
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn vim

RUN gem install bundler 

WORKDIR /app 
COPY Gemfile  ./

ENV BUNDLER_VERSION=2.0.2

RUN bundle config build.nokogiri --use-system-libraries


RUN gem install bundler -v "$BUNDLER_VERSION" 

RUN gem install pg
RUN bundle install



RUN rails generate rspec:install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
