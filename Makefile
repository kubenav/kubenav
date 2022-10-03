.PHONY: bindings-android
bindings-android:
	mkdir -p android/app/src/libs
	gomobile bind -o android/app/src/libs/kubenav.aar -target=android github.com/kubenav/kubenav/cmd/mobile

.PHONY: bindings-ios
bindings-ios:
	mkdir -p ios/Runner/libs
	gomobile bind -o ios/Runner/libs/Kubenav.xcframework -target=ios github.com/kubenav/kubenav/cmd/mobile

.PHONY: library-macos
library-macos:
	GOARCH=amd64 GOOS=darwin CGO_ENABLED=1 go build -buildmode c-shared -o macos/kubenav.x64.dylib github.com/kubenav/kubenav/cmd/desktop
	GOARCH=arm64 GOOS=darwin CGO_ENABLED=1 go build -buildmode c-shared -o macos/kubenav.arm64.dylib github.com/kubenav/kubenav/cmd/desktop
	lipo -create macos/kubenav.x64.dylib macos/kubenav.arm64.dylib -output macos/kubenav.dylib

.PHONY: library-linux
library-linux:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build -buildmode c-shared -o linux/kubenav.so github.com/kubenav/kubenav/cmd/desktop

.PHONY: library-windows
library-windows:
	GOOS=windows GOARCH=amd64 CGO_ENABLED=1 go build -buildmode c-shared -o windows/kubenav.dll github.com/kubenav/kubenav/cmd/desktop
