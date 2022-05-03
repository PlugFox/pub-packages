.PHONY: setup

setup: _setup
	@dart pub global activate pana
	@dart pub global activate grinder
	@flutter pub get
	@grind setup
