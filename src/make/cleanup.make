cleanup:
	#
	#
	# Cleaning up.
	#
	#
ifndef KEEP
	rm -f "$(docbook_file)"
	rm -f "$(build_dir)/"*.xml
	rm -f "$(annotated_dir)/"*.xml
	rm -f "$(fop_dir)/images"
	rm -f "$(fop_file)"
	rm -f "$(upgrade_dir)/"*.xml
	rm -f "$(upgrade_dir)/"*.html
endif


