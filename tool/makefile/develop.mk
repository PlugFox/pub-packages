.PHONY: xcode simulator list-keys fix format

xcode:
	@open ios/Runner.xcworkspace

simulator:
	@open -a Simulator

list-keys:
	@keytool -list -v -keystore ~/.android/debug.keystore.jks -alias androiddebugkey -storepass android -keypass android

fix: format

format:
	@dart fix --apply .
	@dart format -l 120 --fix .
