# Names
main_source                = src
legacy_main_source         = classes
imported_source            = docs
original                   = original
po                         = po
# Source Directories
source_dir                 = $(CURDIR)
config_dir                 = $(source_dir)/conf
build_source_dir           = $(build_dir)/$(main_source)
build_image_dir            = $(build_source_dir)/images
original_dir               = $(build_dir)/$(original)
tools_config_dir           = $(tools_dir)/main/resources/conf
tools_css_dir              = $(tools_dir)/main/resources/css
tools_js_dir               = $(tools_dir)/main/resources/js
extensions_source_dir      = $(tools_dir)/bin/extensions
script_dir                 = $(tools_dir)/build
asciidoc_dir               = $(tools_dir)/bin/asciidoc
po4a_dir                   = $(tools_dir)/bin/po4a
po4a_lib_dir               = $(po4a_dir)/lib
po_dir                     = $(CURDIR)/$(po)
# Commands
asciidoc                   = $(asciidoc_dir)/asciidoc.py
a2x                        = $(asciidoc_dir)/a2x.py
po4a                       = $(po4a_dir)/po4a
po4a_gettextize            = $(po4a_dir)/po4a-gettextize
# Destination directories
extensions_destination_dir = ~/.asciidoc
#
source_document            = $(build_source_dir)/$(project_name).asciidoc
#
docbook_file               = $(build_dir)/$(project_name)-shortinfo.xml
docbook_file_html          = $(build_dir)/$(project_name)-html.xml
#
fop_dir                    = $(build_dir)/pdf
fop_file                   = $(fop_dir)/$(project_name).fo
fop_pdf                    = $(fop_dir)/$(project_name).pdf
#
text_max_width             = 80
text_dir                   = $(build_dir)/text
text_file                  = $(text_dir)/$(project_name).txt
text_html_file             = $(text_file).html
#
single_html_dir            = $(build_dir)/html
single_html_file           = $(single_html_dir)/index.html
#
annotated_dir              = $(build_dir)/annotated
annotated_file             = $(annotated_dir)/index.html
#
chunked_html_dir           = $(build_dir)/chunked
chunked_offline_html_dir   = $(build_dir)/chunked-offline
chunked_target             = $(build_dir)/$(project_name).chunked
chunked_short_info_target  = $(build_dir)/$(project_name)-html.chunked
#
manpages_dir               = $(build_dir)/manpages
upgrade_dir                = $(build_dir)/upgrade
#
#
tmp_po                     = $(build_dir)/tmp.po
po_keep                    = 0

SHELL = /bin/bash

ifdef VERBOSE
	verbose_flag = -v
endif

ifdef KEEP
	keep_flag = -k
endif

ifdef VERSION
	version_number =$(VERSION)
else
	version_number =-neo4j-version
endif

ifdef IMPORTDIR
	import_dir_attribute = --attribute importdir="$(IMPORTDIR)"
else
	import_dir_attribute = --attribute importdir="$(build_dir)/$(imported_source)"
	IMPORTDIR = "$(build_dir)/$(imported_source)"
endif

ifneq (,$(findstring SNAPSHOT,$(version_number)))
	git_version_number =master
else
	git_version_number =$(verbose_flagERSION)
endif

ifndef VERSION
	git_version_number =master
endif

version_attribute =  --attribute neo4j-version=$(version_number)

git_version_attribute = --attribute gitversion=$(git_version_number)

asciidoc_flags = $(verbose_flag) $(version_attribute) $(git_version_attribute) $(import_dir_attribute)

a2x_flags = $(keep_flag) $(asciidoc_flags)

