text: docbook
	#
	#
	# Building text output.
	#
	#
	mkdir -p "$(text_dir)"
	cd "$(text_dir)"
	xsltproc --xinclude --stringparam callout.graphics 0 --stringparam navig.graphics 0 --stringparam admon.textlabel 1 --stringparam admon.graphics 0  --output "$(text_html_file)" "$(CONFDIR)/text.xsl" "$(DOCBOOKFILE)"
	sed 's/ //g' <"$(text_html_file)" >"$(text_html_file).filtered"
	rm -f "$(text_html_file)"
	mv "$(text_html_file).filtered" "$(text_html_file)"
	cd "$(source_dir)"
	cp -f "$(script_dir)/bom" "$(text_file)"
	w3m -cols "$(text_max_width)" -dump -T text/html -no-graph "$(text_html_file)" >> "$(text_file)"
ifndef KEEP
	rm -f "$(text_html_file)"
	rm -f "$(text_dir)/"*.html
	rm -f "$(source_dir)/"*.html
endif

