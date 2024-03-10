# Make sure it matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.0
FROM ruby:$RUBY_VERSION

RUN apt-get update -qq && \
    apt-get install -y bash bash-completion postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

# My app lives here
WORKDIR /app

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle config set path.system true
RUN bundle install

# Copy application code
COPY . .

CMD ["/bin/sh"]
