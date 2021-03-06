# [Choice] Ruby version: 2, 2.7, 2.6, 2.5
ARG VARIANT='3.0'
# FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}
FROM mcr.microsoft.com/vscode/devcontainers/ruby:${VARIANT}

# Default value to allow debug server to serve content over GitHub Codespace's port forwarding service
# The value is a comma-separated list of allowed domains
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev"

# [Choice] Node.js version: lts/*, 16, 14, 12, 10
ARG NODE_VERSION="lts/*"
RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client vim

ENV EDITOR=vim

# [Optional] Uncomment this line to install additional gems.
# RUN gem install <your-gem-names-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

RUN bundle config build.nokogiri --use-system-libraries;

# WORKAROND for error: iseq.rb:13:in `to_binary': wrong argument type false (expected Symbol)
ENV DISABLE_BOOTSNAP_COMPILE_CACHE=false

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

ENV app /app
RUN mkdir $app
WORKDIR $app
ADD . $app

CMD rails s -b 0.0.0.0
