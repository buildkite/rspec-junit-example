#!/bin/bash

set -euo pipefail

mkdir -p tmp

echo "--- :junit: Download the junits"
buildkite-agent artifact download tmp/rspec-*.xml tmp

echo "--- :junit::ruby: Processing the junits"
docker run --rm -v "$(pwd):/app" ruby:3-slim \
  bash -c "cd /app && gem install nokogiri --quiet --silent && ruby /app/.buildkite/lib/junit.rb /app/tmp/*.xml" > tmp/annotation.md

# Check annotation file is not empty
if [ ! -s tmp/annotation.md ]; then
  echo "No annotation content generated. Skipping annotation."
  exit 0
fi

echo "--- :buildkite: Creating annotation"
buildkite-agent annotate --context junit --style error < tmp/annotation.md
