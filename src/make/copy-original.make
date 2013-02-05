copy-original:
	#
	# Copy original.
	#
	cp -fr "$(original_dir)/$(main_source)/"* "$(build_dir)/$(main_source)"
	cp -fr "$(original_dir)/$(imported_source)/"* "$(build_dir)/$(imported_source)"


