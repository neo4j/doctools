offline-html:  manpages copyimages docbook-html
	#
	#
	# Building html output for offline use.
	#
	#
	"$(a2x)" $(V) -L -f chunked -D "$(build_dir)" --xsl-file="$(build_config_dir)/chunked-offline.xsl" -r "$(build_image_dir)" -r "$(tools_css_dir)" --xsltproc-opts "--stringparam admon.graphics 1" --xsltproc-opts "--xinclude" --xsltproc-opts "--stringparam chunk.section.depth 1" --xsltproc-opts "--stringparam toc.section.depth 1" "$(docbook_file_html)"
	rm -rf "$(chunked_offline_html_dir)"
	mv "$(chunked_short_info_target)" "$(chunked_offline_html_dir)"
	cp -fr "$(tools_js_dir)" "$(chunked_offline_html_dir)/js"
	cp -fr "$(tools_css_dir)/"* "$(chunked_offline_html_dir)/css/"
	cp -fr "$(build_image_dir)/"*.png "$(chunked_offline_html_dir)/images"

