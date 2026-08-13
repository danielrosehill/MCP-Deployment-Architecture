#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_dir"

ruby -e '
  require "yaml"
  model = YAML.load_file("architecture/v4/model.yaml")
  abort "unexpected architecture version" unless model.dig("architecture", "version") == "v4"
  puts "model.yaml: valid"
'

for source in architecture/v4/*.md; do
  if grep -q '^```mermaid$' "$source"; then
    output="/tmp/mcp-architecture-$(basename "${source%.md}").svg"
    awk '/^```mermaid$/{on=1;next} /^```$/{if(on)exit} on' "$source" |
      npx -y @mermaid-js/mermaid-cli \
        --puppeteerConfigFile architecture/puppeteer.json \
        --input - \
        --output "$output"
    echo "$source: valid"
  fi
done
