FROM ruby:latest
WORKDIR /opt/
COPY Gemfile /opt/
RUN bundle install && bundle lock
ADD https://raw.githubusercontent.com/travis-ci/travis.rb/master/assets/travis.sh /root/.travis/travis.sh
COPY entrypoint.sh /opt/
WORKDIR /root/
CMD [ "/opt/entrypoint.sh" ]