FROM ruby:2.6

WORKDIR /opt/
COPY Gemfile /opt/
RUN bundle install && bundle lock
ENV PATH=$PATH:/opt/travis-scripts/:/opt/travis-scripts/shortcuts/:/usr/local/bundle/gems/bin
COPY scripts /opt/travis-scripts/
WORKDIR /root
CMD [ "travis" ]