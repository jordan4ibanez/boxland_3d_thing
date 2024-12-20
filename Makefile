default:
	@fpm run


windows:
	@fpm run --c-flag -Wno-discarded-qualifiers --c-flag -Wno-incompatible-pointer-types


# This does not work on macOS :D
gdb:
	@MALLOC_CHECK_=2 fpm run --flag   -g --flag   -lmcheck \
	                         --c-flag -g --c-flag -lmcheck \
													 --cxx-flag -g

valgrind:
	@./scripts/run_valgrind.sh

release:
	@fpm run --flag   -fuse-ld=mold --flag   -O3 --flag   -march=native --flag   -mtune=native --flag   -g \
	         --c-flag -fuse-ld=mold --c-flag -O3 --c-flag -march=native --c-flag -mtune=native --c-flag -g

mac-release:
	@fpm run --flag   -O3 --flag   -march=native --flag   -mtune=native --flag   -g \
	         --c-flag -O3 --c-flag -march=native --c-flag -mtune=native --c-flag -g

.PHONY: test
test:
	@fpm test

.PHONY: test_gdb
test_gdb:
	@MALLOC_CHECK_=2 fpm test --flag   -g --flag   -lmcheck \
	                          --c-flag -g --c-flag -lmcheck


#! BUILD COMMANDS.
.PHONY: build
build:
	@fpm build
	@./scripts/copy_built_file_debug.sh
	
.PHONY: r_build
r_build:
	@fpm build --flag   -fuse-ld=mold --flag   -O3 --flag   -march=native --flag   -mtune=native \
	           --c-flag -fuse-ld=mold --c-flag -O3 --c-flag -march=native --c-flag -mtune=native
	@./scripts/copy_built_file_release.sh


#! CLEANING COMMANDS.
	
# Use this if the vscode extension gives up.
clean:
	@./scripts/clear_mod_files.sh
	@./scripts/remove_build_folder.sh
	@./scripts/remove_out_folder.sh


#? Leaving this in for when polymorphic types are implemented.
# --compiler flang-new 
