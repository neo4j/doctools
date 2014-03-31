upgrade:
	#
	#
	# Building upgrade text.
	#
	#
	mkdir -p "$(upgrade_dir)"
	"$(asciidoc)" --backend docbook -a a2x-format=text --out-file "$(upgrade_dir)/upgrades.xml" "$(build_dir)/docs/neo4j-docs-jar/ops/upgrades.asciidoc"
	# swap out arrow glyph for plain -->
	sed 's/&#8594;/--\&gt;/g' <"$(upgrade_dir)/upgrades.xml" >"$(upgrade_dir)/upgrades.xml.safe"
	rm -f "$(upgrade_dir)/upgrades.xml"
	mv "$(upgrade_dir)/upgrades.xml.safe" "$(upgrade_dir)/upgrades.xml"

