simple-asciidoc-html5:
	#
	#
	# Building HTML5 straight from the AsciiDoc sources.
	#
	#
	mkdir -p "$(html5_dir)/images"
	mkdir -p "$(html5_dir)/css"
	mkdir -p "$(html5_dir)/js"
	if [ -d "$(build_image_dir)/" ]; then \
		rsync -ru "$(build_image_dir)/"* "$(html5_dir)/images";\
	fi
	rsync -ru "$(tools_css_dir)/"* "$(html5_dir)/css"
	rsync -ru "$(tools_js_dir)/"* "$(html5_dir)/js"
	"$(asciidoc)" $(asciidoc_flags) --conf-file="$(build_config_dir)/asciidoc.conf"  --conf-file="$(build_config_dir)/asciidoc.local.conf" --backend html5 --doctype book --attribute docinfo1 --attribute toc --out-file "$(html5_file)" "$(source_document)" || true
	if [ -d "$(build_image_dir)/" ]; then \
		rsync -ru "$(build_image_dir)/"* "$(html5_dir)/images";\
	fi
	rsync -ru "$(tools_css_dir)/"* "$(html5_dir)/css"
	rsync -ru "$(tools_js_dir)/"* "$(html5_dir)/js"
	rsync -ru "$(source_dir)/css/"* "$(html5_dir)/css"
	rsync -ru "$(source_dir)/js/"* "$(html5_dir)/js"


