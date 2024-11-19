FROM ruby:3.3.5-slim

RUN apt-get update -y && apt-get install build-essential -yqq \
    postgresql-client \
    libpq-dev \
    libvips \
    curl \
    git

# Install nodejs 20
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends yarn

RUN curl -LO  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb

RUN groupadd --gid 1000 app && useradd --uid 1000 --gid app --shell /bin/bash --create-home app && \
    mkdir -p /app && \
    chown -R app:app /app && \
    chmod -R 755 app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

RUN gem install foreman

COPY package.json yarn.lock ./

RUN yarn install

COPY . ./

USER app

EXPOSE 3000
