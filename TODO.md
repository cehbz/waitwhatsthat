# TODO

## Taxonomy
- Design categories, locations and tags together. Tags are the superset: every attribute of a post is a tag. Categories and locations exist for browsing and discovery.
- Add a `locations` taxonomy (venue, city, country), populate it from the posts, and put Locations back in the main menu.
- Categories carry no information today: `restaurants` is on every post, including Machu Picchu, Nazca and the Tbilisi dentist post. Place names (`lima`, `peru`, `paracas`…) and category words (`restaurants`, `restaurant`, `markets`, `travel`) are mixed into tags. Any tag or category URL that goes away gets a 301 to its replacement.
- Four posts have no tags (amoramar, dental-adventures-in-georgia, nazca, osaka), and la-paz-street-food has only `street-food`.

## Content
- tambo-ciek: its photos were lost in the 2024 migration and the Wayback Machine has none of them. `content/posts/tambo-ciek/images/*.png` are grey stand-ins under the original names. Restore the originals (`PXL_20210508_{023047531,023723996,024256847,024603791,024606948}.jpg`, Pixel photos taken 2021-05-08) and change the `.png` references in `index.md`, or remove the images.
- Image URLs from the 2018 WordPress site (`/wp-content/uploads/YYYY/MM/<lowercased-name>.jpg`, 18 archived) 404. The current files differ in case and Unicode normalization, so a redirect needs a generated table. Worth doing if Search Console shows them being requested.
- `/images/jizos.jpg` was published in 2021 and now 404s; `assets/images/jizos.jpg` is in the repo and nothing uses it.

## Gallery and images
- Lightbox indexes collide: the `img` shortcode numbers images in page-resource order and the `gallery` shortcode numbers them in EXIF-date order, and both fill the same lightbox list. Clicking an inline figure can open a different photo.
- The `img` shortcode ignores `fill`, `fit` and `resize`: `{{- $srcImg := … -}}` inside each `if` declares a new variable, so inline figures serve the full-size original.

## Repository
- Images were committed as Git LFS pointers. `.gitattributes` was deleted in bdae128 and `git-lfs` is not installed on lwus, so git reports every image as modified and a fresh clone cannot build the site. Either reinstate LFS (install it, restore `.gitattributes`, confirm the objects are on GitHub) or move the images into plain git.

## Unverified
- The contact form posts to Formspree (`f/myylyqwj`) and comments use Disqus (`waitwhatsthat`); whether either still delivers is unknown.
- Why the Search Console 404s began on 2026-10-24: nothing changed on lwus then (journal, apt and login records), and as of 2024-12-19 nginx answered these URLs with a plain 404 (`~/configs.tar.gz`). Check Search Console crawl stats by response and the Cloudflare audit log for that week.
