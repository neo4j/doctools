add:
	#
	# Add a new document to a po file.
	#
	# Note that the translated file has to have the same
	# structure as the original.
	# Usage:
	# make add DOCUMENT="src/introduction/the-neo4j-graphdb.asciidoc" PART="introduction"
	#
	if [ -z "$(DOCUMENT)" ]; then echo "Missing parameter 'DOCUMENT'."; exit 1; fi
	if [ -z "$(PART)" ]; then echo "Missing parameter 'PART'."; exit 1; fi
	$(eval target_document="$(target)/$(DOCUMENT)")
	$(eval translated="$(DOCUMENT)")
	$(eval original="$(target)/$(original)/$(DOCUMENT)")
	if grep -q $(original) "$(po_dir)/$(PART).conf"; then \
		echo "Document already added: $(DOCUMENT)"; exit 1; fi
	$(eval options=-f text -o asciidoc -L UTF-8 -M UTF-8)
	$(eval year=`date +%Y`)
	if [ -f "$(translated)" ]; then \
		PERLLIB=$(po4a_lib_dir) $(po4a_gettextize) $(options) -m $(original) -p "$(tmp_po)" -l $(translated);\
		else \
		PERLLIB=$(po4a_lib_dir) $(po4a_gettextize) $(options) -m $(original) -p "$(tmp_po)";\
	fi
	msginit -i "$(tmp_po)" -o "$(tmp_po).tmp" --locale "$(language)" --no-translator
	rm "$(tmp_po)"
	touch "$(tmp_po)"
	echo "# Copyright (C) $(year) Neo Technology." >> "$(tmp_po)";\
	tail -n +5 "$(tmp_po).tmp" >> "$(tmp_po)"
	touch "$(po_dir)/$(PART).po";\
	msgcat -o "$(po_dir)/$(PART).po" "$(po_dir)/$(PART).po" "$(tmp_po)"
	if [ ! -f "$(po_dir)/$(PART).conf" ]; then \
		echo "[po4a_paths] $(target)/pot/$(PART).pot fr:$(po)/$(PART).po" >> "$(po_dir)/$(PART).conf";\
		echo "[options] opt: \"-L UTF-8 -M UTF-8 -A UTF-8 -o definitions=target/tools/main/resources/conf/translate-styles\"" >> "$(po_dir)/$(PART).conf";\
	fi
	echo "[type: asciidoc] $(original) $(language):$(target_document)" >> "$(po_dir)/$(PART).conf"
	# Document was added (if this line is reached)!

