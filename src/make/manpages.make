manpages:
	#
	#
	# Building manpages.
	#
	#
	mkdir -p "$(manpages_dir)"
	"$(script_dir)/manpage.sh" "$(V)" "$(manpages_dir)" "$(import_dir)" "$(a2x)" "$(script_dir)" $(manpage_list) 2>&1 | "$(script_dir)/outputcheck-manpages.sh"
	# clean up
	mkdir -p "$(annotated_dir)"
	cp "$(manpages_dir)/"*.xml "$(annotated_dir)"
	mv "$(manpages_dir)/"*.xml "$(build_dir)"
	rm -rf "$(manpages_dir)/"*.html

