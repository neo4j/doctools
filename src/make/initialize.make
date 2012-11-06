initialize:
	#
	#
	# Setting correct file permissions and moving source code.
	# Copy configuration, so we can combine different config sources easily.
	#
	#
	find $(tools_dir) \( -path '*.py' -o -path '*.sh' \) -exec chmod 0755 {} \;
	find $(po4a_dir) \( -path '*po4a' -o -path '*po4a-*' \) -exec chmod 0755 {} \;
	if [ -d "$(original_dir)/sources/" ]; then \
		rm -rf "$(build_dir)/sources";\
		mv "$(original_dir)/sources" "$(build_dir)/sources";\
	fi
	if [ -d "$(original_dir)/test-sources/" ]; then \
		rm -rf "$(build_dir)/test-sources";\
		mv "$(original_dir)/test-sources" "$(build_dir)/test-sources";\
	fi
	if [ -d "$(original_dir)/$(legacy_main_source)/" ]; then \
		rm -rf "$(original_dir)/$(main_source)";\
		mv "$(original_dir)/$(legacy_main_source)" "$(original_dir)/$(main_source)";\
	fi
	mkdir -p "$(build_config_dir)"
	rsync -ru "$(tools_config_dir)/"* "$(build_config_dir)"
	if [ -d "$(config_dir)/" ]; then \
		rsync -ru "$(config_dir)/"* "$(build_config_dir)";\
	fi

