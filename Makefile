.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":[^#]*? #| #"}; {printf "%-42s%s\n", $$1 $$3, $$2}'

.PHONY: setup
setup:	
	$(MAKE) install
	$(MAKE) open

.PHONY: install
install:
	./install.sh

.PHONY: generate-resources
rs: # Generate resources with SwiftGen
	mint run swiftgen

.PHONY: generate-xcodeproj
proj: # Generate project with XcodeGen
	mint run xcodegen xcodegen generate

.PHONY: open
open: # Open workspace in Xcode
	open `find . -maxdepth 1 -mindepth 1 -iname "*.xcworkspace"`
