.PHONY: setup

setup: _setup
	@dart pub global activate pana
	@dart pub global activate grinder
	@flutter pub get
	@grind setup
	@npm install -g firebase-tools
	@firebase init
	-firebase login
	@flutter pub global activate intl_utils
	@dart pub global activate flutterfire_cli
	@flutterfire configure \
		-i dev.plugfox.pubPackages \
		-m dev.plugfox.pub_packages \
		-a dev.plugfox.pub_packages \
		-p pub-packages \
		-e plugfox@gmail.com \
		-o lib/src/common/constant/firebase_options.g.dart
