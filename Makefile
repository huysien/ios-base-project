.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":[^#]*? #| #"}; {printf "%-42s%s\n", $$1 $$3, $$2}'

.PHONY: setup
setup:
	$(MAKE) install-ruby
	$(MAKE) install-bundler
	$(MAKE) install-mint
	$(MAKE) generate-resources
	$(MAKE) generate-xcodeproj
	$(MAKE) install-cocoapods
	$(MAKE) open

.PHONY: install-ruby
install-ruby:
	brew install rbenv ruby-build
	cat .ruby-version | xargs rbenv install --skip-existing
	eval "$(rbenv init -)"

.PHONY: install-bundler
install-bundler: # Install Bundler dependencies
	gem uninstall bundler --force
	gem install bundler:2.3.4 --force
	bundle install

.PHONY: install-mint
install-mint: # Install Mint dependencies
	brew install mint

.PHONY: generate-resources
generate-resources: # Generate resources with SwiftGen
	mint run swiftgen

.PHONY: generate-xcodeproj
generate-xcodeproj: # Generate project with XcodeGen
	mint run xcodegen xcodegen generate

.PHONY: install-cocoapods
install-cocoapods: # Install CocoaPods dependencies and generate workspace
	bundle exec pod install

.PHONY: open
open: # Open workspace in Xcode
	open `find . -maxdepth 1 -mindepth 1 -iname "*.xcworkspace"`
