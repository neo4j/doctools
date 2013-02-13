annotated:
	#
	#
	# Building annotated html output.
	#
	#
	mkdir -p "$(annotated_dir)"
	"$(a2x)" $(a2x_flags) -L -a showcomments -f xhtml -D "$(annotated_dir)" --conf-file="$(build_config_dir)/xhtml.conf" --asciidoc-opts "--conf-file=\"$(build_config_dir)/asciidoc.conf\""  --asciidoc-opts "--conf-file=\"$(build_config_dir)/asciidoc.local.conf\"" --asciidoc-opts "--conf-file=\"$(build_config_dir)/docbook45.conf\"" --asciidoc-opts "--conf-file=\"$(build_config_dir)/linkedimages.conf\"" --xsl-file="$(build_config_dir)/xhtml.xsl" --xsltproc-opts "--stringparam admon.graphics 1" "$(source_document)"
	cp -fR "$(build_js_dir)" "$(annotated_dir)"
	cp -fR "$(build_css_dir)" "$(annotated_dir)"
	cp -fR "$(build_image_dir)/"*.png "$(annotated_dir)/images"
	mv "$(annotated_dir)/$(project_name).html" "$(annotated_file)"

