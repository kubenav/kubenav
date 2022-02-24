.PHONY: bindings
bindings: bindings-android bindings-ios

.PHONY: bindings-android
bindings-android:
	mkdir -p android/libs
	gomobile bind -o android/libs/kubenav.aar -target=android github.com/kubenav/kubenav/cmd/kubenav

.PHONY: bindings-ios
bindings-ios:
	mkdir -p ios/Frameworks
	gomobile bind -o ios/Frameworks/Kubenav.xcframework -target=ios github.com/kubenav/kubenav/cmd/kubenav
