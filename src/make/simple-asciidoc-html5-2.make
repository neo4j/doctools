simple-asciidoc-html5-2:
	#
	#
	# Building HTML5 straight from the AsciiDoc sources.
	#
	#
	mkdir -p "$(html5_2_dir)/images"
	mkdir -p "$(html5_2_dir)/css"
	mkdir -p "$(html5_2_dir)/js"
	if [ -d "$(build_image_dir)/" ]; then \
		rsync -ru "$(build_image_dir)/"* "$(html5_2_dir)/images";\
	fi
	rsync -ru "$(tools_css_dir)/"* "$(html5_2_dir)/css"
	rsync -ru "$(tools_js_dir)/"* "$(html5_2_dir)/js"
	"$(asciidoc)" $(asciidoc_flags) --conf-file="$(build_config_dir)/asciidoc.conf"  --conf-file="$(build_config_dir)/asciidoc.local.conf" --backend html5 --doctype book --attribute docinfo --attribute toc --out-file "$(html5_2_file)" "$(source_document)" || true
	if [ -d "$(build_image_dir)/" ]; then \
		rsync -ru "$(build_image_dir)/"* "$(html5_2_dir)/images";\
	fi
	rsync -ru "$(tools_css_dir)/"* "$(html5_2_dir)/css"
	rsync -ru "$(tools_js_dir)/"* "$(html5_2_dir)/js"
	rsync -ru "$(source_dir)/css/"* "$(html5_2_dir)/css"
	rsync -ru "$(source_dir)/js/"* "$(html5_2_dir)/js"


