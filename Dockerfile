#FROM ruby:2.5-alpine
FROM ruby:2.5

#RUN apk update && apk add build-base git
RUN apt update && apt install -y build-essential git

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
#COPY Gemfile ./
#RUN bundle install --binstubs
RUN bundle install
#RUN bundle

COPY . .

CMD puma -C config/puma.rb
