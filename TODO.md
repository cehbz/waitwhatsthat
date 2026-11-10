# TODO

## Taxonomy
- Design categories, locations and tags together. Tags are the superset: every attribute of a post is a tag. Categories and locations exist for browsing and discovery.
- Add a `locations` taxonomy (venue, city, country), populate it from the posts, and put Locations back in the main menu.
- Categories carry no information today: `restaurants` is on every post, including Machu Picchu, Nazca and the Tbilisi dentist post. Place names (`lima`, `peru`, `paracas`…) and category words (`restaurants`, `restaurant`, `markets`, `travel`) are mixed into tags. Any tag or category URL that goes away gets a 301 to its replacement.
- Four posts have no tags (amoramar, dental-adventures-in-georgia, nazca, osaka), and la-paz-street-food has only `street-food`.

## Content
- tambo-ciek: its photos were lost in the 2024 migration and the Wayback Machine has none of them. `content/posts/tambo-ciek/images/*.webp` are stand-ins under the original names: the 16x12 blurred previews embedded in the archived 2021 page. Restore the originals (`PXL_20210508_{023047531,023723996,024256847,024603791,024606948}.jpg`, Pixel photos taken 2021-05-08), which are in Google Photos and possibly Drive's `_Photos` folder, and change the `.webp` references in `index.md`, or remove the images.
- Image URLs from the 2018 WordPress site (`/wp-content/uploads/YYYY/MM/<lowercased-name>.jpg`, 18 archived) 404. The current files differ in case and Unicode normalization, so a redirect needs a generated table. Worth doing if Search Console shows them being requested.
- `/images/jizos.jpg` was published in 2021 and now 404s; `assets/images/jizos.jpg` is in the repo and nothing uses it.

## Gallery and images
- The lightbox is unverified in a browser: that a thumbnail and an inline figure each open their own photo, and the 404 page's appearance.
- The lightbox opens the original JPG (5 of 504 exceed 3 MB). Serve a large resize instead, which also stops publishing full-resolution originals.
- The `img` shortcode ignores `fill`, `fit` and `resize`: `{{- $srcImg := … -}}` inside each `if` declares a new variable, so inline figures serve the full-size original.

## Checks and serving
- Nothing runs `scripts/check-site`. Run `--live` at the end of `deploy.sh`, and daily through update-check's email, with the failing URLs and the command to reproduce in the alert.
- The old-URL rules exist twice: in `/etc/caddy/Caddyfile` on lwus, which is in no repo, and as the expected table in `scripts/check-site`. Keep the Caddy snippet in this repo and `import` it from the Caddyfile, so a rebuilt host gets the rules back.
- The snippet's four `/feed` and `/comments/feed` lines collapse into one `path_regexp` matcher.

## Unverified
- The contact form posts to Formspree (`f/myylyqwj`) and comments use Disqus (`waitwhatsthat`); whether either still delivers is unknown.
- Why the Search Console 404s began on 2026-10-24: nothing changed on lwus then (journal, apt and login records), and as of 2024-12-19 nginx answered these URLs with a plain 404 (`~/configs.tar.gz`). Check Search Console crawl stats by response, the Cloudflare audit log for that week, and the Search Console emails between January 2025 and November 2026 for whether these alerts recur.
