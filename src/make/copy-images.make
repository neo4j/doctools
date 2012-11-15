copy-images:
	#
	#
	# Copying images from source projects.
	#
	#
	if [ -d "$(import_dir)" ]; then \
		"$(script_dir)/copy-images.sh" "$(import_dir)" "$(build_image_dir)" '*images';\
	fi


