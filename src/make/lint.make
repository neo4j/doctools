lint:
	#
	#
	# Checking DocBook validity.
	#
	#
	xmllint --nonet --noout --xinclude --postvalid "$(docbook_file)"
	xmllint --nonet --noout --xinclude --postvalid "$(docbook_file_html)"

