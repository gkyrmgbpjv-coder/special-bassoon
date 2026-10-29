# Abondance — site du restaurant

Site vitrine du restaurant Abondance, 81 bis avenue de Bayonne, 31240 L'Union.

Site statique, sans framework. Voir `CLAUDE.md` pour le contexte, les informations à compléter et la direction artistique.

## Mise en ligne sur Netlify

1. Sur app.netlify.com : **Add new site → Import an existing project → GitHub**, choisir ce dépôt et la branche `main`.
2. Ne rien changer aux réglages : `netlify.toml` fournit tout (commande `sh netlify-build.sh`, dossier publié `dist`).
3. Déployer. Le script copie uniquement les fichiers publics dans `dist/` (pas `.claude/` ni `CLAUDE.md`) et remplace `[VOTRE-DOMAINE]` dans `robots.txt` et `sitemap.xml` par l'URL du site (variable `URL` de Netlify, donc le domaine personnalisé s'il est configuré).
4. **Domain management** : ajouter le domaine du restaurant. HTTPS (Let's Encrypt) est activé automatiquement ; vérifier que « Force HTTPS » est actif. Relancer ensuite un déploiement pour que le sitemap prenne le bon domaine.
5. Déposer le sitemap dans Google Search Console.

Déjà en place : page 404 (servie automatiquement par Netlify), en-têtes de sécurité (HSTS, CSP, X-Frame-Options, etc.), copie locale de Three.js dans `vendor/` utilisée si cdnjs ne répond pas.

Avant d'ouvrir au public, compléter les `[...]` : horaires, mentions légales (dont l'hébergeur : Netlify, Inc., adresse à reprendre sur netlify.com), image `og:image`.

Si un outil de mesure d'audience est branché dans `loadAnalytics()`, ajouter son domaine à la `Content-Security-Policy` de `netlify.toml`.

## Tester en local

```sh
python3 -m http.server 8000   # puis http://localhost:8000
sh netlify-build.sh           # pour vérifier le contenu de dist/
```
