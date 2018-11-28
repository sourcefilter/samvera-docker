FROM ruby:2.5

RUN gem install bundler
# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1
RUN apt-get update -qq && apt-get install -y mysql-client build-essential libpq-dev nodejs 

ENV BUNDLE_PATH /bundle_dir
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["bundle exec rails server"]
