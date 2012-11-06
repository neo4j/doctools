include $(make_dir)/base.make

.PHONY: preview init cleanup initialize install-extensions annotated copy-images docbook docbook-html html html-offline manpages pdf simple-asciidoc text upgrade html-check text-check year-check copy-original copy-translated add refresh

preview: copy-original copy-translated refresh simple-asciidoc

init: initialize install-extensions

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
include $(make_dir)/simple-asciidoc.make
include $(make_dir)/text.make
include $(make_dir)/upgrade.make

include $(make_dir)/html-check.make
include $(make_dir)/text-check.make
include $(make_dir)/year-check.make

include $(make_dir)/copy-original.make
include $(make_dir)/copy-translated.make
include $(make_dir)/add.make
include $(make_dir)/refresh.make


