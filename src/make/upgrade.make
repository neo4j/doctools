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
	xmllint --nonet --noout --valid "$(upgrade_dir)/upgrades.xml"
	cd "$(upgrade_dir)"
	xsltproc  --stringparam callout.graphics 0 --stringparam navig.graphics 0 --stringparam admon.textlabel 1 --stringparam admon.graphics 0  --output "$(upgrade_dir)/upgrades.text.html" "$(asciidoc_dir)/docbook-xsl/text.xsl" "$(upgrade_dir)/upgrades.xml"
	cd "$(source_dir)"
	w3m -cols $(text_max_width) -dump -T text/html -no-graph "$(upgrade_dir)/upgrades.text.html" > "$(upgrade_dir)/upgrades.text"
	cp -f "$(script_dir)/bom" "$(upgrade_dir)/UPGRADE.txt"
	cat "$(upgrade_dir)/upgrades.text" >> "$(upgrade_dir)/UPGRADE.txt"
	rm "$(upgrade_dir)/upgrades.text"

