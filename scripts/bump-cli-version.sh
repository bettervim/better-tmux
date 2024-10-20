#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: No version type provided."
  echo "Usage: $0 [patch|minor|major|<specific-version>]"
  exit 1
fi

version_type=$1

cd packages/cli
npm version $version_type --no-git-tag-version
git add .
git commit -m "bumping CLI version [skip-ci]"

if [ $? -eq 0 ]; then
  echo "Version bumped successfully to $(npm pkg get version | tr -d '\"')"
else
  echo "Error: Failed to bump the version."
  exit 1
fi

