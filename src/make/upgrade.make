upgrade:
	#
	#
	# Building upgrade text.
	#
	#
	mkdir -p "$(upgrade_dir)"
	"$(asciidoc)" --backend docbook -a a2x-format=text --out-file "$(upgrade_dir)/upgrades.xml" "$(build_dir)/docs/neo4j-docs-jar/ops/upgrades.asciidoc"

