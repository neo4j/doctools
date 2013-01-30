include $(make_dir)/base.make

.PHONY: preview init dist check cleanup initialize install-extensions annotated copy-images docbook docbook-html html html-offline manpages pdf simple-asciidoc text upgrade html-check text-check year-check

preview: copy-images simple-asciidoc-html5

init: initialize install-extensions

dist: initialize install-extensions manpages copy-images docbook-html html-offline html-check docbook pdf text text-check html upgrade cleanup year-check

commented: copy-images annotated

check: docbook-html html-offline html-check text text-check cleanup

include $(make_dir)/cleanup.make
include $(make_dir)/initialize.make
include $(make_dir)/install-extensions.make

include $(make_dir)/annotated.make
include $(make_dir)/copy-images.make
include $(make_dir)/docbook.make
include $(make_dir)/docbook-html.make
include $(make_dir)/html.make
include $(make_dir)/html-offline.make
include $(make_dir)/manpages.make
include $(make_dir)/pdf.make
include $(make_dir)/simple-asciidoc-html5.make
include $(make_dir)/text.make
include $(make_dir)/upgrade.make

include $(make_dir)/html-check.make
include $(make_dir)/text-check.make
include $(make_dir)/year-check.make

