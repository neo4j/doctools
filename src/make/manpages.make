manpages:
	#
	#
	# Building manpages.
	#
	#
	mkdir -p "$(manpages_dir)"
	"$(script_dir)/manpage.sh" "$(V)" "$(manpages_dir)" "$(import_dir)" "$(asciidoc)" "$(script_dir)" $(manpage_list) 2>&1 | "$(script_dir)/outputcheck-manpages.sh"

