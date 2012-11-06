docbook:  manpages copy-images
	#
	#
	# Building docbook output with short info.
	# Checking DocBook validity.
	#
	#
	mkdir -p "$(build_dir)"
	"$(asciidoc)" $(asciidoc_flags) --backend docbook --attribute docinfo1 --attribute nonhtmloutput=1 --doctype book --conf-file="$(build_config_dir)/asciidoc.conf" --conf-file="$(build_config_dir)/asciidoc.local.conf" --conf-file="$(build_config_dir)/docbook45.conf" --out-file "$(docbook_file)" "$(source_document)"
	xmllint --nonet --noout --xinclude --postvalid "$(docbook_file)"

