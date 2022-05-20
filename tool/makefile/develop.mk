.PHONY: xcode simulator list-keys

xcode:
	@open ios/Runner.xcworkspace

simulator:
	@open -a Simulator

list-keys:
	@keytool -list -v -keystore ~/.android/debug.keystore.jks -alias androiddebugkey -storepass android -keypass android 