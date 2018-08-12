FROM ruby:2.5
# change to use ruby-apline image??

RUN apt update && apt install -y build-essential git

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD puma -C config/puma.rb
