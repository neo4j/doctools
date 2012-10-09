refresh:
	#
	#
	# Execute po4a on po-files.
	#
	#
	find "$(po_dir)" -name "*.conf" -print0 | xargs -t -0 -I {} bash -c "PERLLIB=$(po4a_lib_dir) $(po4a) -f --keep $(po_keep) {}"

