.PHONY: codegen

CFLAGS += -D osx

_echo_os:
	@echo "Running Makefile on macOS"

_setup:
	@brew update
	@brew install coreutils

codegen:
	@nohup /bin/bash -c ' \
		gtimeout 60 flutter pub get \
		&& gtimeout 300 flutter pub run build_runner build --delete-conflicting-outputs \
		&& say "Code generation completed" || say "Code generation failed!" ' >/dev/null 2>&1 &
