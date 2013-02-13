html: manpages copy-images docbook-html
	#
	#
	# Building html output.
	# Checking for missing images/resources.
	#
	#
	"$(a2x)" $(verbose_flag) -L -f chunked -D "$(build_dir)" --xsl-file="$(build_config_dir)/chunked.xsl" -r "$(build_image_dir)" -r "$(tools_css_dir)" --xsltproc-opts "--stringparam admon.graphics 1" --xsltproc-opts "--xinclude" --xsltproc-opts "--stringparam chunk.section.depth 1" --xsltproc-opts "--stringparam toc.section.depth 1" "$(docbook_file_html)" 2>&1 | "$(script_dir)/outputcheck-images.sh"
	rm -rf "$(chunked_html_dir)"
	mv "$(chunked_short_info_target)" "$(chunked_html_dir)"
	if [ -d "$(build_source_dir)/css/" ]; then \
		cp -fR "$(build_source_dir)/css" "$(chunked_html_dir)";\
	fi
	if [ -d "$(build_source_dir)/js/" ]; then \
		cp -fR "$(build_source_dir)/js" "$(chunked_html_dir)";\
	fi
	cp -fR "$(build_image_dir)/"*.png "$(chunked_html_dir)/images"

