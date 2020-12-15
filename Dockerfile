# Pre setup stuff
FROM ruby:2.7.2 as builder

# Install system dependencies & clean them up
# libnotify-dev is what allows you to watch file changes w/ HMR
RUN apt-get update -qq && apt-get install -y \
    postgresql-client build-essential \
    libnotify-dev && \
    rm -rf /var/lib/apt/lists/*

# This is where we build the rails app
FROM builder as rails-app

# Allow access to port 3000 & 3035
EXPOSE 3000
EXPOSE 3035

# This is to fix an issue on Linux with permissions issues
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG APP_DIR=/home/user/ruptiva_api

# Create a non-root user
RUN groupadd --gid $GROUP_ID user
RUN useradd --no-log-init --uid $USER_ID --gid $GROUP_ID user --create-home

# Remove existing running server
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# fixing Permissions
RUN mkdir -p $APP_DIR
RUN chown -R $USER_ID:$GROUP_ID $APP_DIR

# Define the user running the container
USER $USER_ID:$GROUP_ID

WORKDIR $APP_DIR

# Install rails related dependencies
COPY --chown=$USER_ID:$GROUP_ID Gemfile* $APP_DIR/

# Fix an issue with outdated bundler
RUN gem install bundler
RUN bundle install

# Copy over all files
COPY --chown=$USER_ID:$GROUP_ID . .

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Start the main process.
CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]