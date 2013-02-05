copy-translated:
	#
	# Copy translated documents.
	#
	if [ -d "$(source_dir)/$(main_source)/" ]; then cp -fr "$(source_dir)/$(main_source)/"* "$(build_dir)/$(main_source)"; fi
	if [ -d "$(source_dir)/$(imported_source)/" ]; then cp -fr "$(source_dir)/$(imported_source)/"* "$(build_dir)/$(imported_source)"; fi


