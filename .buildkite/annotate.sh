#!/bin/bash

set -euo pipefail

echo "--- :buildkite: Creating annotation"

buildkite-agent artifact download junit-annotation.md

buildkite-agent annotate --context junit --style error < junit-annotation.md
