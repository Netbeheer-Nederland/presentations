#!/usr/bin/env bash

echo 'Cleaning up output directory `docs/`…'
rm -rf docs

echo 'Generating HTML for presentations…'
cp -r src docs
find docs -type f -name index.adoc -exec npx asciidoctor-revealjs -r asciidoctor-kroki {} \+
echo -e 'done.\n'
