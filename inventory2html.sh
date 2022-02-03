#!/usr/bin/env bash

cat "$1" | 
	grep -vE "^ID\W" |
	while read LINE; do
		VENDOR="$(echo "$LINE" | cut -f 3)"
		THING="$(echo "$LINE" | cut -f 4)"
		DESC="$(echo "$LINE" | cut -f 5)"
		MEDIA="$(echo "$LINE" | cut -f 6)"
		SLOT="$(echo "$LINE" | cut -f 7)"
		PRICE="$(echo "$LINE" | cut -f 8)"
		echo "<details><summary><strong>$SLOT ($PRICE)</strong> <span class="name">"$THING"</span></summary><p>$DESC</p><p class="deets">$MEDIA created by $VENDOR</p></details>";
	done

