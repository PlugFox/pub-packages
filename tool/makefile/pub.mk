.PHONY: clean get upgrade upgrade-major outdated

clean:
	@rm -rf coverage .dart_tool .packages pubspec.lock

get:
	@timeout 60 flutter pub get

upgrade:
	@timeout 60 flutter pub upgrade

upgrade-major:
	@timeout 60 flutter pub upgrade --major-versions

outdated: upgrade
	@timeout 120 flutter pub outdated --dependency-overrides \
		--dev-dependencies --prereleases --show-all --transitive
