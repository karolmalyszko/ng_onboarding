FROM ruby:2.5

RUN apt update && apt install -y build-essential git

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD puma -C config/puma.rb
