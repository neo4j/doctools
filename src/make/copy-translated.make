copy-translated:
	#
	# Copy translated documents.
	#
	if [ -d "$(source_dir)/$(main_source)/" ]; then cp -fR "$(source_dir)/$(main_source)" "$(build_dir)"; fi
	if [ -d "$(source_dir)/$(imported_source)/" ]; then cp -fR "$(source_dir)/$(imported_source)" "$(build_dir)"; fi


