ifdef DOCTYPE
	doctype =$(DOCTYPE)
endif

ifdef NOTOC
	docbook_toc =toc!
endif

ifdef NOTNUMBERED
	docbook_numbered =numbered!
endif

docbook:
	#
	#
	# Building docbook output with short info.
	#
	#
	mkdir -p "$(build_dir)"
	"$(asciidoc)" $(asciidoc_flags) --backend docbook --attribute docinfo1 --attribute nonhtmloutput=1 --doctype $(doctype) --attribute $(docbook_toc) --attribute $(docbook_numbered) --conf-file="$(build_config_dir)/asciidoc.conf" --conf-file="$(build_config_dir)/asciidoc.local.conf" --conf-file="$(build_config_dir)/docbook45.conf" --out-file "$(docbook_file)" "$(source_document)"

