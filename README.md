# iOSBaseProject
This repo includes a base structure for an iOS project.
# Usage
### Running setup environment for project
```
$ make setup
```
### Generate resources
```
$ make rs
```
### Generate xcodeproj
```
$ make proj
```
# About
### Gem
`rbenv` is used to manage the Ruby version and `bundler` is used to manage all gem versions at the local level of the project. 
A gem that we use in many projects is cocoapods. 
There will be a conflict between team members if the version of cocoapods is not controlled.
So, we have some Ruby-related files here:
```
.ruby-version
Gemfile
Gemfile.lock
```
### Mint
Open Mintfile, there are two libraries which use in this project:
```
yonaskolb/XcodeGen
SwiftGen/SwiftGen // To generate resources
```
`XcodeGen` is used to generate `.xcodeproj` file based on what we describe in `project.yml` file. So we can add `.xcodeproj` into `.gitignore`.
It can reduce huge conflicts in `.xcodeproj` file when each member adds folders, and files to the project.
Especially when we start a new project which has many team members.

`SwiftGen` is used to generate structured data for accessing all resources (strings, images, colors) in source code. It can help us reduce the time to repeat defining resources, unify the convention, and avoid typo mistakes. 

### Pods
Cocoapods libraries in the project, some needed and popular libs already are added.

### VIPER
The template for creating the VIPER module for screens is put on the repo, too. You can copy it to:
```
/Users/huypham/Library/Developer/Xcode/Templates
```
to start using.
You may need to create the Templates folder if it doesn’t exist.

### Make
This project uses Makefile to easily set up environments and quickly call some kind of commands if needed.
