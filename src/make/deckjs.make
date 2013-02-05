deck: initialize install-extensions
	#
	#
	# Building deck.js slides.
	#
	#
	mkdir -p "$(deck_dir)/deck.js"
	mkdir -p "$(deck_dir)/js"
	mkdir -p "$(deck_dir)/css"
	mkdir -p "$(deck_dir)/images"
	mkdir -p "$(build_image_dir)"
	#cp -r "$(IMGDIR)" "$(DECKDIR)/"
	"$(asciidoc)" $(asciidoc_flags) -b deckjs --conf-file="$(build_config_dir)/asciidoc.conf" --conf-file="$(build_config_dir)/asciidoc.local.conf" --conf-file="$(build_config_dir)/deckjs.conf" --attribute console=1 --out-file "$(deck_dir)/index.html" "$(source_dir)/slides.asciidoc"
	cp -fr "$(deckjs_dir)/"* "$(deck_dir)/deck.js"
	cp -fr "$(build_image_dir)/"* "$(deck_dir)/images"
	cp -fr "$(tools_css_dir)/"* "$(deck_dir)/css"
	cp -fr "$(tools_js_dir)/"* "$(deck_dir)/js"

