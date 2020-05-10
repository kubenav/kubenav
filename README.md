<div align="center">
  <img src="utils/assets/github-logo.png" width="200" />
  <br><br>

  **kubenav** is the navigator for your **Kubernetes** clusters right in your pocket. kubenav is a **mobile and desktop** app to help you manage Kubernetes clusters and stay up to date on whats going on in your clusters.

  <p>
    <a href="https://apps.apple.com/us/app/kubenav/id1494512160" target="_blank"><img src="utils/assets/app-store-badge.png" height="50"></a>
    <a href="https://play.google.com/store/apps/details?id=io.kubenav.kubenav" target="_blank"><img src="utils/assets/google-play-badge.png" height="50"></a>
    <a href="https://github.com/kubenav/kubenav/releases" target="_self"><img src="utils/assets/desktop-badge.png" height="50"></a>
  </p>

  <img src="utils/assets/github-screenshot.png" width="100%" />
</div>

kubenav is a mobile and desktop app to help you manage Kubernetes clusters. The app provides an overview of all your workloads and resources running in your clusters, including the current status. The details view of your workloads contains all the necessary logs and events to debug your clusters in case of problems. You can also edit and delete resources within the app.

The app is developed using [Ionic Framework](https://ionicframework.com) and [Capacitor](https://capacitor.ionicframework.com). The most parts of the app are implemented using React functional component and TypeScript. So we can achieve nearly 100% code sharing between the mobile and desktop implementation.

## Features

- [x] **Available for mobile and desktop**: kubenav is available for mobile and desktop with nearly 100% code sharing.
- [x] **Manage Workloads**: Manage workloads like Deployments, Pods and StatefulSets in your Kubernetes cluster.
- [x] **View your resources**: Get an overview of other resources like Services, ConfigMaps, Persistent Volumes, Secrets and Role Bindings.
- [x] **CRD support**: Out of the box support for Custom Resource Definitions.
- [x] **Filter**: Filter the resource overview by the selected Namespace.
- [x] **Debugging**: Automatic detection of problems with your Workloads. Get all corresponding events and logs.
- [x] **Edit YAML files**: Edit and save your YAML files right from the app.
- [x] **Delete resources**: Delete resources which are not needed anymore.
- [x] **Resource usage**: Get the resource usage of your nodes, pods and containers.
- [x] **Manage multiple clusters**: Add multiple clusters via `kubeconfig` or manually.

## Beta and Nightly Builds

For testing new features and faster feedback, we provide an **Beta** app via Apple Testflight and Google Play:

- [Apple Testflight](https://testflight.apple.com/join/RQUFGkHi)
- [Google Play](https://play.google.com/apps/testing/io.kubenav.kubenav)

For the desktop version we are running nightly builds for the `master` branch via GitHub Action. The binaries are uploaded to the GitHub Workflow as artifact. You can select a workflow from the following page: [https://github.com/kubenav/kubenav/actions?query=workflow%3ABuild+event%3Aschedule](https://github.com/kubenav/kubenav/actions?query=workflow%3ABuild+event%3Aschedule) to download the binary for your platform.

## Development

kubenav requires [Node v8.6.0](https://nodejs.org/) or later, and NPM version 5.6.0 or later (which is usually automatically installed with the required version of Node). If you have Node and NPM installed, install Ionic CLI:

```sh
npm install -g ionic
```

Besides Node, kubenav requires [Go 1.14](https://golang.org) and [Go mobile](https://github.com/golang/go/wiki/Mobile), which can be installed using the following commands:

```sh
go get -u golang.org/x/mobile/cmd/gomobile
go install golang.org/x/mobile/cmd/gomobile
gomobile init
```

To build the Electron version of kubenav, install the [go-astilectron-bundler](https://github.com/asticode/go-astilectron-bundler):

```sh
go get -u github.com/asticode/go-astilectron-bundler/...
go install github.com/asticode/go-astilectron-bundler/astilectron-bundler
```

To build the iOS version of kubenav ensure that you have [Xcode](https://developer.apple.com/xcode/) and [CocoaPods](https://cocoapods.org) installed. For the Android version you need the Android SDK, which can be installed via [Android Studio](https://developer.android.com/studio) and the [NDK](https://developer.android.com/ndk/). Also ensure that the `ANDROID_HOME` and `ANDROID_NDK_HOME` environment variables are set.

Clone the repository, login to GitHub packages and install the required dependencies:

```sh
git clone git@github.com:kubenav/kubenav.git
cd kubenav

npm install
```

To use kubenav in your browser you need to build and start the development server. The server listening on port `14122`:

```sh
make build-devserver && ./bin/devserver
```

Now you can start the app and open [localhost:8100](http://localhost:8100) in your browser:

```sh
ionic serve
```

You must build the kubenav project at least once before running on any native platform:

```sh
ionic build

make bindings-android
make bindings-ios
```

Every time you perform a build (e.g. `ionic build`) that changes your web directory (default: `build`), you'll need to copy those changes down to your native projects:

```sh
npx cap sync
```

The native iOS and Android projects are opened in their standard IDEs (Xcode and Android Studio, respectively). Use the IDEs to run kubenav:

```sh
npx cap open ios
npx cap open android
```

You can also run the native iOS or Android app with live reloading:

```sh
ionic capacitor run android -l --address=0.0.0.0
ionic capacitor run ios -l --address=0.0.0.0
```

To build the Electron version of kubenav run `make build-electron`. The app can be found in the `cmd/electron/output/<PLATFORM>-amd64` folder:

```sh
make build-electron
```

## Release

Every new release is created from the `master` branch. To create a new release the `version` field in the `package.json` file must be updated and a new tag must be set. This process is automated via `Makefile`:

```sh
make release-patch
make release-minor
make release-major
```

When the tag is pushed the changelog will be generated via GitHub Action and saved to the [CHANGELOG.md](./CHANGELOG.md) file. When the changelog was generated a new GitHub release can be created with the following naming scheme and the changelog for the current tag as description:

```
Version <TAG> (yyyy-mm-dd)
```

After the release was created another GitHub Action is executed to create the Electron app for macOS, Linux and Windows via [go-astilectron-bundler](https://github.com/asticode/go-astilectron-bundler). These files are added to the corresponding release. The following files are available for each release:

- `kubenav-darwin-amd64.tar.gz`
- `kubenav-linux-amd64.tar.gz`
- `kubenav-windows-amd64.tar.gz`

The native iOS and Android app is built manually and submitted to the App Store and Google Play. To prepare the native app, run the following commands:

```sh
make bindings-android
make bindings-ios

export REACT_APP_VERSION=

ionic build

npx cap sync

npx cap open ios
npx cap open android
```

In the standard IDE for iOS and Android run a clean build and follow the steps to publish the app.
