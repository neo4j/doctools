simple-asciidoc:
	#
	#
	# Building HTML straight from the AsciiDoc sources.
	#
	#
	mkdir -p "$(single_html_dir)/images"
	mkdir -p "$(single_html_dir)/css"
	mkdir -p "$(single_html_dir)/js"
	if [ -d "$(build_image_dir)/" ]; then \
		cp -fr "$(build_image_dir)/"* "$(single_html_dir)/images";\
	fi
	cp -fr "$(tools_css_dir)/"* "$(single_html_dir)/css"
	cp -fr "$(tools_js_dir)/"* "$(single_html_dir)/js"
	"$(asciidoc)" $(asciidoc_flags) --conf-file="$(build_config_dir)/asciidoc.conf" --conf-file="$(build_config_dir)/asciidoc.local.conf" --doctype book --attribute docinfo1 --attribute toc --out-file "$(single_html_file)" "$(source_document)" || $(single_html_unchecked)
	if [ -d "$(build_image_dir)/" ]; then \
		cp -fr "$(build_image_dir)/"* "$(single_html_dir)/images";\
	fi
	cp -fr "$(tools_css_dir)/"* "$(single_html_dir)/css"
	cp -fr "$(tools_js_dir)/"* "$(single_html_dir)/js"


