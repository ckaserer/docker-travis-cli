FROM ruby:latest

WORKDIR /opt/

COPY Gemfile /opt/

RUN bundle install && bundle lock

ENV PATH=$PATH:/opt/travis-scripts/:/opt/travis-scripts/shortcuts/

COPY scripts /opt/travis-scripts/

CMD [ "travis" ]