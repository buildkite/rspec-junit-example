#!/bin/bash

set -euo pipefail

mkdir -p tmp

echo "--- :junit: Download the junits"
buildkite-agent artifact download tmp/rspec-*.xml tmp

echo "--- :junit::ruby: Processing the junits"
docker run --rm -v "$(pwd):/app" ruby:3-slim \
  bash -c "cd /app && gem install nokogiri --quiet --silent && ruby /app/.buildkite/lib/junit.rb /app/tmp/*.xml" > tmp/annotation.md

echo "--- :buildkite: Creating annotation"
buildkite-agent annotate --context junit --style error < tmp/annotation.md
