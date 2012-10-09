include $(make_dir)/base.make

.PHONY: preview init refresh cleanup initialize installextensions copyoriginal copytranslated simple-asciidoc add

preview: copyoriginal copytranslated refresh simple-asciidoc

init: initialize installextensions

include $(make_dir)/cleanup.make
include $(make_dir)/initialize.make
include $(make_dir)/installextensions.make
include $(make_dir)/simple-asciidoc.make
include $(make_dir)/copyoriginal.make
include $(make_dir)/copytranslated.make
include $(make_dir)/add.make
include $(make_dir)/refresh.make


