#!/usr/bin/env bash

if ! [ -d .git ]; then echo 'Please run this command from the Git repository root exclusively.' && exit 1; fi

echo 'Cleaning up output directory `docs/`…'
rm -rf docs

echo 'Generating HTML for presentations…'
cp -r src docs
find docs -type f -name index.adoc -exec npx asciidoctor-revealjs -r asciidoctor-kroki {} \+
echo -e 'done.\n'

echo 'Generating index page…'
echo 
cat <<EOF > docs/index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>NBNL Models :: Presentations</title>
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
      #main {
        font-family: Poppins, sans-serif;
        width: 70vw;
        margin-left: auto;
      }
      a {
        color: #005f87;
        text-decoration: none;
      }
      a:hover {
        text-decoration: underline;
      }
      h1 {
        color: #002d41;
        font-weight: 600;
      }
    </style>
  </head>
  <body>
    <div id="main">
      <h1>NBNL Modellen &mdash; Presentations</h1>
      <h2>Presentations</h2>
      <ul id="presentations">
EOF
grep -m 1 -o -P '(?<=== ).*' docs/*/index.adoc | sed 's/docs\/\([^\/]\+\)\/index\.adoc\:\(.*\)/       <li><a href="\1" class="presentation">\2<\/a><\/li>/' >> docs/index.html
cat <<EOF >> docs/index.html
      </ul>
    </div>
  </body>
</html>
EOF
