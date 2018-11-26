FROM ruby:2.5 as base
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
RUN apt-get update -qq && apt-get install -y mysql-client build-essential libpq-dev nodejs 

FROM base as ursus
RUN mkdir /ursus
WORKDIR /ursus
COPY ursus/Gemfile /ursus/Gemfile
COPY ursus/Gemfile.lock /ursus/Gemfile.lock
RUN bundle install
COPY ./ursus /ursus
CMD ["bundle exec rails server"]

FROM base as californica
RUN mkdir /californica
WORKDIR /californica
COPY californica/Gemfile /californica/Gemfile
COPY californica/Gemfile.lock /californica/Gemfile.lock
RUN bundle install
COPY ./californica /californica
ENV DATABASE_HOST=db
ENV DATABASE_PASSWORD=californica
ENV DATABASE_USERNAME=californica
ENV FEDORA_URL=http://fcrepo:8080/fcrepo/rest
ENV REDIS_HOST=redis
ENV REDIS_PORT=6379
ENV REDIS_URL=redis://redis:6379/0
ENV SOLR_URL=http://solr:8983/solr/californica
CMD ["bundle exec rails server"]
