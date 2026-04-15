# Copyright Layer5, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include .github/build/Makefile.core.mk
include .github/build/Makefile.show-help.mk

#----------------------------------------------------------------------------
# Academy
# ---------------------------------------------------------------------------
.PHONY: setup build build-production build-preview site clean check-go theme-update

BASE_URL ?=

## ------------------------------------------------------------
----LOCAL_BUILDS: Show help for available targets
	
## Local: Install site dependencies
setup:
	@if [ -f package-lock.json ] || [ -f npm-shrinkwrap.json ]; then \
		npm ci; \
	else \
		npm i; \
	fi

## Local: Build site for local consumption
build:
	BASE_URL="$(BASE_URL)" npm run build

## CI: Build production site output
build-production:
	BASE_URL="$(BASE_URL)" npm run build:production

## CI: Build preview site output and mark it non-indexable
build-preview:
	BASE_URL="$(BASE_URL)" npm run build:preview

## Local: Build and run site locally with draft and future content enabled.
site: check-go
	hugo server -D -F
	
## Empty build cache and run on your local machine.
clean: 
	hugo --cleanDestinationDir
	make setup
	make site

## ------------------------------------------------------------
----MAINTENANCE: Show help for available targets

check-go:
	@echo "Checking if Go is installed..."
	@command -v go > /dev/null || (echo "Go is not installed. Please install it before proceeding."; exit 1)
	@echo "Go is installed."

## Update the academy-theme package to latest version
theme-update:
	echo "Updating to latest academy-theme..." && \
	hugo mod get github.com/layer5io/academy-theme
