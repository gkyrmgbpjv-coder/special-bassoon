#!/bin/sh
# Construit dist/ : uniquement les fichiers publics (pas .claude/, CLAUDE.md, etc.)
# et renseigne le domaine dans robots.txt et sitemap.xml avec l'URL fournie par Netlify.
set -eu
rm -rf dist
mkdir dist
cp index.html 404.html mentions-legales.html confidentialite.html robots.txt sitemap.xml dist/
cp -R vendor dist/
if [ -d assets ]; then cp -R assets dist/; fi
SITE="${URL:-}"
if [ -n "$SITE" ]; then
  SITE="${SITE%/}"
  sed -i "s|https://\[VOTRE-DOMAINE\]|$SITE|g" dist/robots.txt dist/sitemap.xml
fi
echo "dist/ prêt (domaine : ${SITE:-non défini})"
