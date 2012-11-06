install-extensions: initialize
	#
	#
	# Installing asciidoc extensions.
	#
	#
	mkdir -p $(extensions_destination_dir)
	cp -fr "$(extensions_source_dir)/"* $(extensions_destination_dir)

