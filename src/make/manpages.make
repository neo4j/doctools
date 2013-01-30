manpages:
	#
	#
	# Building manpages.
	#
	#
	mkdir -p "$(manpages_dir)"
	"$(script_dir)/manpage.sh" "$(V)" "$(manpages_dir)" "$(import_dir)" "$(a2x)" "$(script_dir)" "neo4j server" "neo4j-coordinator server" "neo4j-coordinator-shell server" "neo4j-shell shell" "neo4j-backup backup" 2>&1 | "$(script_dir)/outputcheck-manpages.sh"
	# clean up
	mkdir -p "$(annotated_dir)"
	cp "$(manpages_dir)/"*.xml "$(annotated_dir)"
	mv "$(manpages_dir)/"*.xml "$(build_dir)"
	rm -rf "$(manpages_dir)/"*.html

