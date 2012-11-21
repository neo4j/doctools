include $(make_dir)/base.make

.PHONY: preview preview2 init dist check cleanup initialize install-extensions copy-images simple-asciidoc-html5

preview: copy-images simple-asciidoc-html5

init: initialize install-extensions

include $(make_dir)/cleanup.make
include $(make_dir)/initialize.make
include $(make_dir)/install-extensions.make

include $(make_dir)/copy-images.make
include $(make_dir)/simple-asciidoc-html5.make

include $(make_dir)/docbook.make
include $(make_dir)/pdf.make


