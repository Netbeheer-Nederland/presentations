#!/usr/bin/env bash

if ! [ -d .git ]; then echo 'Please run this command from the Git repository root exclusively.' && exit 1; fi

echo -n 'Cleaning up output directory: docs… '
rm -rf docs
echo 'ok.'
if [ -z $1 ]; then
    echo -n 'Generating HTML for presentations… '
    cp -r src docs
else
    echo -n "Generating HTML for presentation $1… "
    mkdir -p docs
    cp -r src/common src/themes docs/
    cp -r $1 docs/
fi
find docs -type f -name index.adoc -exec npx asciidoctor-revealjs -r asciidoctor-kroki {} \+ > /dev/null
echo 'ok.'
echo -n 'Generating index page… '
cat <<EOF > docs/index.html
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <link rel="stylesheet" href="https://modellen.netbeheernederland.nl/assets/css/just-the-docs-default.css">
        <link rel="stylesheet" href="https://modellen.netbeheernederland.nl/assets/css/just-the-docs-nav.css" id="jtd-head-nav-stylesheet">
        <style id="jtd-nav-activation">
            .site-nav > ul.nav-list:first-child > li:not(:nth-child(1)) > a, .site-nav > ul.nav-list:first-child > li > ul > li a {
                background-image: none;
            }

            .site-nav > ul.nav-list:not(:first-child) a, .site-nav li.external a {
                background-image: none;
            }

            .site-nav > ul.nav-list:first-child > li:nth-child(1) > a {
                font-weight: 600;
                text-decoration: none;
            }

            .site-nav > ul.nav-list:first-child > li:nth-child(1) > button svg {
                transform: rotate(-90deg);
            }

            .site-nav > ul.nav-list:first-child > li.nav-list-item:nth-child(1) > ul.nav-list {
                display: block;
            }
        </style>
        <script src="/assets/js/just-the-docs.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="/assets/images/favicon.png" type="image/x-icon">
        <!-- Begin Jekyll SEO tag v2.8.0 -->
        <title>Presentations | Team Semantiek</title>
        <meta name="generator" content="Jekyll v3.10.0"/>
        <meta property="og:title" content="Startpagina"/>
        <meta property="og:locale" content="en_US"/>
        <meta name="description" content="GitHub Pages default repo"/>
        <meta property="og:description" content="GitHub Pages default repo"/>
        <link rel="canonical" href="http://modellen.netbeheernederland.nl/presentations/"/>
        <meta property="og:url" content="http://modellen.netbeheernederland.nl/presentations/"/>
        <meta property="og:site_name" content="Presentations | Team Semantiek"/>
        <meta property="og:type" content="website"/>
        <meta name="twitter:card" content="summary"/>
        <meta property="twitter:title" content="Startpagina"/>
        <script type="application/ld+json">
            {
                "@context": "https://schema.org",
                "@type": "WebSite",
                "description": "GitHub Pages default repo",
                "headline": "Startpagina",
                "name": "Presentations | Team Semantiek",
                "publisher": {
                    "@type": "Organization",
                    "logo": {
                        "@type": "ImageObject",
                        "url": "http://modellen.netbeheernederland.nl/assets/images/logo.svg"
                    }
                },
                "url": "http://modellen.netbeheernederland.nl/presentations/"
            }</script>
        <!-- End Jekyll SEO tag -->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap'); </style>
    </head>
    <body>
        <a class="skip-to-main" href="#main-content">Skip to main content</a>
        <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
            <symbol id="svg-link" viewBox="0 0 24 24">
                <title>Link</title>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-link">
                    <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path>
                    <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path>
                </svg>
            </symbol>
            <symbol id="svg-menu" viewBox="0 0 24 24">
                <title>Menu</title>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
                    <line x1="3" y1="12" x2="21" y2="12"></line>
                    <line x1="3" y1="6" x2="21" y2="6"></line>
                    <line x1="3" y1="18" x2="21" y2="18"></line>
                </svg>
            </symbol>
            <symbol id="svg-arrow-right" viewBox="0 0 24 24">
                <title>Expand</title>
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg>
            </symbol>
            <!-- Feather. MIT License: https://github.com/feathericons/feather/blob/master/LICENSE -->
            <symbol id="svg-external-link" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-external-link">
                <title id="svg-external-link-title">(external link)</title>
                <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path>
                <polyline points="15 3 21 3 21 9"></polyline>
                <line x1="10" y1="14" x2="21" y2="3"></line>
            </symbol>
            <!-- Bootstrap Icons. MIT License: https://github.com/twbs/icons/blob/main/LICENSE.md -->
            <symbol id="svg-copy" viewBox="0 0 16 16">
                <title>Copy</title>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard" viewBox="0 0 16 16">
                    <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
                    <path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>
                </svg>
            </symbol>
            <symbol id="svg-copied" viewBox="0 0 16 16">
                <title>Copied</title>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-check-fill" viewBox="0 0 16 16">
                    <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3Zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3Z"/>
                    <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5v-1Zm6.854 7.354-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708Z"/>
                </svg>
            </symbol>
        </svg>
        <div class="main" id="top">
            <div id="main-header" class="main-header">
                <div></div>
                <nav aria-label="Auxiliary" class="aux-nav">
                    <ul class="aux-nav-list">
                        <li class="aux-nav-list-item">
                            <a href="https://github.com/netbeheer-nederland/presentations" class="site-button">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" style="height:1rem; margin-right:0.5em; margin-bottom:0.1rem">
                                    <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.05-.015-2.07-3.345.72-4.05-1.605-4.05-1.605-.54-1.38-1.335-1.755-1.335-1.755-1.095-.75.09-.735.09-.735 1.215.09 1.845 1.245 1.845 1.245 1.08 1.86 2.835 1.32 3.525 1.005.105-.78.42-1.32.765-1.62-2.67-.3-5.475-1.335-5.475-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405 1.02 0 2.04.135 3 .405 2.28-1.56 3.285-1.245 3.285-1.245.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.285 0 .315.225.69.825.57A12.02 12.02 0 0 0 24 12c0-6.63-5.37-12-12-12z"/>
                                </svg>
                                Source Code 
                            </a>
                        </li>
                        <li class="aux-nav-list-item">
                            <a href="mailto:teamsemantiek@netbeheernederland.nl" class="site-button">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" style="height:1rem; margin-right:0.5em; margin-bottom:0.1rem">
                                    <path d="M16.067,13.6l7.685,6.587A2.968,2.968,0,0,0,24,19V8.549Z"></path>
                                    <path d="M12.538,13.473,23.892,6.247A3,3,0,0,0,21,4H3A3,3,0,0,0,.108,6.247l11.355,7.226A1.006,1.006,0,0,0,12.538,13.473Z"></path>
                                    <path d="M0,8.549V19a2.968,2.968,0,0,0,.248,1.185L7.933,13.6Z"></path>
                                    <path d="M14.314,14.714l-.7.447a3.016,3.016,0,0,1-3.221,0l-.7-.448c-.015.014-.021.033-.036.046L1.618,21.645A2.953,2.953,0,0,0,3,22H21a2.957,2.957,0,0,0,1.383-.355L14.35,14.759C14.334,14.746,14.328,14.727,14.314,14.714Z"></path>
                                </svg>
                                Contact 
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="main-content-wrap">
                <div id="main-content" class="main-content">
                    <main>
                        <h1 id="modellen-van-netbeheer-nederland-presentations">
                            <a href="#modellen-van-netbeheer-nederland-presentations" class="anchor-heading" aria-labelledby="modellen-van-netbeheer-nederland-presentations">
                                <svg viewBox="0 0 16 16" aria-hidden="true">
                                    <use xlink:href="#svg-link"></use>
                                </svg>
                            </a>
			    Presentations | Team Semantiek
                        </h1>
                        <ul id="presentations">
EOF
grep -m 1 -oH -P '(?<== ).*' docs/*/index.adoc | sed 's/docs\/\([^\/]\+\)\/index\.adoc\:\(.*\)/       <li><code>[<a href="\1">\1<\/a>]<\/code>\2<\/li>/' >> docs/index.html
cat <<EOF >> docs/index.html
      </ul>
    </div>
  </body>
</html>
EOF
echo 'ok.'
echo
echo 'done.'
