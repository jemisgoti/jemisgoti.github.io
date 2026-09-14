# jemisgoti.github.io

Personal website of **Jemis Goti** — Flutter engineer building beyond the widget tree.

Built in Dart with [Jaspr](https://jaspr.site) in static mode: every route is pre-rendered to plain HTML
at build time, so pages are fast, indexable and need no JavaScript to read. A small `web/site.js` adds the
theme toggle, mobile menu, copy buttons and scroll reveals.

## Develop

```sh
dart pub global activate jaspr_cli
dart pub get
jaspr serve        # http://localhost:8080
```

## Build

```sh
jaspr build --sitemap-domain https://jemisgoti.github.io --sitemap-exclude "^/404"
# output: build/jaspr
```

Stop `jaspr serve` before running `jaspr build` — both use the same build daemon.

Pushing to `main` builds and deploys to GitHub Pages via `.github/workflows/build_and_deploy.yml`.

## Structure

| Path | Purpose |
| --- | --- |
| `lib/data/site.dart` | All content: packages, projects, articles, research, contact, profiles |
| `lib/pages/` | Routes: `/`, `/open-source`, `/work`, `/writing`, `/about`, `/contact`, `/404` |
| `lib/components/` | Layout, cards, SEO metadata (Open Graph, JSON-LD), icons |
| `web/` | `styles.css`, `site.js`, favicon, `robots.txt` |

## Content rules

Content comes from public sources (pub.dev, GitHub, Medium, LinkedIn). Don't add clients, metrics,
dates or outcomes that can't be verified publicly. Package versions and likes are shown through live
pub.dev badges, never hard-coded.
