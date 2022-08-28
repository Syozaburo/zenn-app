FROM ruby:2.6.6

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

COPY entrypoint.sh /entrypoint.sh
RUN chmod 744 /entrypoint.sh
CMD ["sh", "/entrypoint.sh"]
