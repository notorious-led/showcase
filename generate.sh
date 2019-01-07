#!/usr/bin/env bash
set -euf

pwd
SLUGS="$(ls img | grep -E '\.jpg$' | sed -e 's/.*\///' -e 's/\..*//' | xargs)"
echo "We will generate: $SLUGS"

for SLUG in $SLUGS; do
	echo -n "$SLUG "

	export thing_text="$(cat text/$SLUG.html)"
	export thing_slug="$SLUG"
	j2 template.j2 > "$SLUG.html"

done
echo "done."
