#!/bin/sh

set -e

if [ "${INPUT_BUNDLE}" = "true" ]; then
  gem install bundler:2.0.2
  bundle install --deployment --jobs 4 --retry 3
elif [ -z "${INPUT_VERSION}" ]; then
  gem install attractor
elif [ "${INPUT_VERSION}" = "latest" ]; then
  gem install attractor
else
  gem install attractor -v "${INPUT_VERSION}"
fi

ruby /action/index.rb
