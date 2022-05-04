.PHONY: build deploy

build: codegen
	@flutter build web --release --no-source-maps --pwa-strategy offline-first \
		--web-renderer auto --base-href / --dart-define=environment=production

deploy: build
	@firebase deploy