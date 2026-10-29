# Site du restaurant Abondance (L'Union)

Site vitrine statique (HTML/CSS/JS, sans build) pour le restaurant **Abondance**, bistrot et cave à vins.

## Faits vérifiés (ne pas inventer d'autres informations)
- Adresse : 81 bis avenue de Bayonne, 31240 L'Union
- Téléphone : 05 82 08 10 53 — la réservation se fait par téléphone
- Note Google : 4,6/5 sur 247 avis ; Pages Jaunes 5/5 (3 avis) ; prix moyen 30–40 € par personne
- Services : terrasse, cocktails, options végétariennes, accès fauteuil sur réservation, menu enfant
- Concept (ardoise du restaurant) : produits frais et de saison, cuisine créative aux inspirations du monde, plats qui changent chaque semaine, pièces de bœuf maturées maison, charcuteries maison, cave où choisir sa bouteille
- Carte : prix relevés sur une carte de 2025, indicatifs

## À compléter (placeholders `[...]` dans les fichiers)
- Horaires détaillés (seule certitude : service du soir jusqu'à 23 h)
- Mentions légales : forme juridique, SIRET, RCS, gérant, e-mail, hébergeur, date
- Photos réelles du restaurant (aucune photo n'est encore fournie) et image `og:image` 1200×630
- Domaine dans `robots.txt` et `sitemap.xml` : rempli automatiquement au déploiement Netlify (`netlify-build.sh`)

## Fichiers
- `index.html` : page d'accueil. Scène 3D Three.js r128 (cdnjs) de la côte de bœuf maturée, carte sur planches à pince, estimateur « Une côte pour combien ? », avis, infos, bannière cookies (la mesure d'audience ne se charge qu'après accord ; `loadAnalytics()` est vide).
- `mentions-legales.html`, `confidentialite.html`, `404.html` (liens absolus `/`), `robots.txt`, `sitemap.xml` (page d'accueil seule : les pages légales sont en `noindex`).
- `vendor/three.min.js` : copie locale de Three.js r128, chargée seulement si cdnjs échoue.
- `netlify.toml` + `netlify-build.sh` : déploiement Netlify (publie `dist/`, en-têtes de sécurité, CSP). Toute nouvelle ressource externe doit être ajoutée à la CSP.
- `.claude/skills/` : skills de design et de test (impeccable, taste-skill, ui-ux-pro-max et ses compagnons, awesome-design-md, playwright-cli). Jamais publiés.
- `index.html` contient aussi les mentions et la confidentialité en vues internes (`#mentions`, `#confidentialite`) : c'était nécessaire pour l'aperçu dans claude.ai. Sur un vrai hébergement, les liens du pied de page peuvent pointer vers les fichiers `.html` dédiés.

## Direction artistique
- Ambiance nuit de bistrot : fond sombre `#0f1412`, encre papier `#f2ead9`, ambre des suspensions `#eaa23c` réservé à l'action « Réserver », bleu cobalt de la façade `#2a3a9e` (section avis), vert ardoise `#1f2d26`, papier peint jungle.
- Polices : Big Shoulders Display (titres), Instrument Sans (texte), Courier Prime uniquement sur les feuilles de carte (la vraie carte est tapée à la machine).
- Un seul appel à l'action : réserver par téléphone.

## Exigences de qualité
- Tout élément avec l'attribut `hidden` doit rester masqué : la règle `[hidden]{display:none!important}` en tête du CSS ne doit pas être retirée.
- Accessibilité : contraste ≥ 4,5:1, focus visible, cibles ≥ 44 px, textes alternatifs, `prefers-reduced-motion` respecté.
- Responsive 390 / 768 / 1440 px sans défilement horizontal.
- Checklist de mise en ligne : HTTPS forcé, page 404, sitemap + robots.txt, favicon, meta title/description, bannière cookies conforme CNIL, aucune clé d'API côté front, liens tous fonctionnels.
