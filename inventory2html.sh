#!/usr/bin/env bash

echo '<p>Here are the contents of the vending machine, as of <span class="gendate">the last time it was restocked</span>. Tap on one of the items to reveal details about the piece and its creator.</p>'

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

echo '<p>Feel free to <a href="vending.html">read more about the vending machine</a>, especially if you want to sell your wares. And you can also <a href="/">check out our other projects</a>.'
