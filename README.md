# kubenav

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Contributing

Go mobile:

```sh
go install golang.org/x/mobile/cmd/gomobile@latest
gomobile init
```

Create icons:

- `flutter pub run flutter_launcher_icons:main`

Sort imports:

- `flutter pub run import_sorter:main`

Build for testing on native device:

- `flutter run --release`

Create a new release:

- Create a file `/android/key.properties`

```
storePassword=
keyPassword=
keyAlias=upload
storeFile=
```

- Update the `version` key in the `pubspec.yaml` file

- Run `make bindings-android` and `make bindings-ios` to build the Go code

- Delete old builds `rm -rf build`

- Build the app: `flutter build appbundle`
- Updload the build from `/build/app/outputs/bundle/release/app-release.aab` to https://play.google.com/apps/publish

- Build the app: `flutter build ipa`
- Open the `/build/ios/archive/Runner.xcarchive` file in Xcode then click **Validate App** and **Distribute App**
- Open https://appstoreconnect.apple.com
