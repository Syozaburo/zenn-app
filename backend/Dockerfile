FROM ruby:3.0.2

ENV RAILS_ENV=production

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  sudo && \
  bundle config set force_ruby_platform true && \
  bundle

RUN bundle install

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
