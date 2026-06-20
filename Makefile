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

BASE_URL ?=

## Install site dependencies
setup:
	@if [ -f package-lock.json ] || [ -f npm-shrinkwrap.json ]; then \
		npm ci; \
	else \
		npm install; \
	fi

## Build and run site locally with draft and future content enabled.
site: check-deps check-go
	hugo server -D -F

## Build site for local consumption
build: check-deps
	hugo --baseURL="$(BASE_URL)"

## Build preview site with configured base URL
build-preview: check-deps
	hugo --baseURL="$(BASE_URL)"

## CI: Build production site output
build-production: check-deps
	hugo --baseURL="$(BASE_URL)" --minify -D --buildFuture

## Empty build cache and run on your local machine.
clean: 
	hugo --cleanDestinationDir
	make setup
	make site

## Fix Markdown linting issues
lint-fix:
	@echo "Running markdownlint-cli2 --fix..."
	@npx --yes markdownlint-cli2 --fix "**/*.md" "#node_modules" "#public" "#resources"

## Verify required commands and local dependencies are present.
check-deps:
	@echo "Checking if 'npm' and 'hugo' are available..."
	@command -v npm > /dev/null || { echo "Error: 'npm' not found. Please install Node.js and npm."; exit 1; }
	@command -v hugo > /dev/null || { echo "Error: 'hugo' not found. Please install Hugo."; exit 1; }
	@echo "Dependencies check passed."

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

.PHONY: \
	setup \
	site \
	build \
	build-preview \
	build-production \
	clean \
	lint-fix \
	check-deps \
	check-go \
	theme-update