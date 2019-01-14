FROM ruby:2.5

ARG node_version=11.6.0

RUN gem install bundler

# ensure that nodejs is not installed via distribution package management
COPY nodejs-blacklist /etc/preferences.d/nodejs-blacklist

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1
RUN apt-get update -qq && apt-get install -y mysql-client build-essential libpq-dev nodeenv
RUN echo 'building nodejs from source for best compatibility, this is slow'
RUN nodeenv --force -n $node_version /usr/local

ENV BUNDLE_PATH /usr/local/bundle
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD ["bundle exec rails server"]
