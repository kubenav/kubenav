.PHONY: bindings-android
bindings-android:
	mkdir -p android/app/src/libs
	go tool gomobile bind -o android/app/src/libs/kubenav.aar -target=android -androidapi=24 github.com/kubenav/kubenav/cmd/kubenav

.PHONY: bindings-ios
bindings-ios:
	mkdir -p ios/Runner/libs
	go tool gomobile bind -o ios/Runner/libs/Kubenav.xcframework -target=ios github.com/kubenav/kubenav/cmd/kubenav
