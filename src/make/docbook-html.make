docbook-html:
	#
	#
	# Building docbook output with short info for html outputs.
	# Checking for missing include files.
	#
	#
	mkdir -p "$(build_dir)"
	"$(asciidoc)" $(asciidoc_flags) --backend docbook --attribute docinfo1 --attribute console=1 --doctype book --conf-file="$(build_config_dir)/asciidoc.conf" --conf-file="$(build_config_dir)/asciidoc.local.conf" --conf-file="$(build_config_dir)/docbook45.conf" --conf-file="$(build_config_dir)/linkedimages.conf" --out-file "$(docbook_file_html)" "$(source_document)" 2>&1 | "$(script_dir)/outputcheck-includefiles.sh"

