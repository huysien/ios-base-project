#!/bin/sh

# Install Ruby
brew install rbenv ruby-build
cat .ruby-version | RUBY_CFLAGS="-w" xargs rbenv install --skip-existing
eval "$(rbenv init -)"

# Install Bundler and Gems
gem install bundler
bundle install

# Install Mint
brew install mint

# Generate resources
mint run swiftgen

# Generate project
mint run xcodegen xcodegen generate

# Install Pods
bundle exec pod install
