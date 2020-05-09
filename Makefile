BRANCH      ?= $(shell git rev-parse --abbrev-ref HEAD)
BUILDTIME   ?= $(shell date '+%Y-%m-%d@%H:%M:%S')
BUILDUSER   ?= $(shell id -un)
REPO        ?= github.com/kubenav/kubenav
REVISION    ?= $(shell git rev-parse HEAD)
VERSION     ?= $(shell git describe --tags)

.PHONY: bindings-android bindings-ios build-devserver build-electron release-beta release-major release-minor release-patch

bindings-android:
	mkdir -p android/app/src/libs
	gomobile bind -o android/app/src/libs/server.aar -target=android github.com/kubenav/kubenav/pkg/server

bindings-ios:
	mkdir -p ios/App/App/libs
	gomobile bind -o ios/App/App/libs/Server.framework -target=ios github.com/kubenav/kubenav/pkg/server

build-devserver:
	go build -ldflags "-X ${REPO}/pkg/version.Version=${VERSION} \
		-X ${REPO}/pkg/version.Revision=${REVISION} \
		-X ${REPO}/pkg/version.Branch=${BRANCH} \
		-X ${REPO}/pkg/version.BuildUser=${BUILDUSER} \
		-X ${REPO}/pkg/version.BuildDate=${BUILDTIME}" \
		-o ./bin/devserver ./cmd/devserver;

build-electron:
	rm -rf cmd/electron/resources/app
	rm -rf cmd/electron/output
	cp -r build cmd/electron/resources/app
	cd cmd/electron && astilectron-bundler -ldflags -X:${REPO}/pkg/version.Version=${VERSION},${REPO}/pkg/version.Revision=${REVISION},${REPO}/pkg/version.Branch=${BRANCH},${REPO}/pkg/version.BuildUser=${BUILDUSER},${REPO}/pkg/version.BuildDate=${BUILDTIME}

release-beta:
	git checkout master
	git pull

	# We increase the version for every new beta release. Therefore it can be happen that when we set a new tag for a
	# production release that we skip some version number.
	$(eval PATCHVERSION=$(shell cat ios/App/App.xcodeproj/project.pbxproj | grep MARKETING_VERSION | tail -n1 | awk '{print substr($$3, 1, length($$3)-1)}'))
	$(eval PATCHVERSION=$(shell echo "${PATCHVERSION}" | awk -F. '{print $$1"."$$2"."$$3+1}'))

	$(eval ANDROID_VERSION_CODE=$(shell grep versionCode android/app/build.gradle | awk '{print $$2+1}'))
	sed -i.bak 's/versionCode .*/versionCode ${ANDROID_VERSION_CODE}/g' android/app/build.gradle
	sed -i.bak 's/versionName .*/versionName "${PATCHVERSION}"/g' android/app/build.gradle
	rm -f android/app/build.gradle.bak

	$(eval IOS_CF_BUNDLE_VERSION=$(shell /usr/libexec/PlistBuddy -c "Print CFBundleVersion" ios/App/App/Info.plist))
	$(eval IOS_CF_BUNDLE_VERSION=$(shell echo $$(($(IOS_CF_BUNDLE_VERSION)+1))))
	/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${IOS_CF_BUNDLE_VERSION}" ios/App/App/Info.plist
	sed -i.bak 's/MARKETING_VERSION = .*/MARKETING_VERSION = ${PATCHVERSION};/g' ios/App/App.xcodeproj/project.pbxproj
	rm -f ios/App/App.xcodeproj/project.pbxproj.bak

	git add .
	git commit -m 'Prepare beta release $(PATCHVERSION)'
	git push

release-major:
	git checkout master
	git pull

	$(eval MAJORVERSION=$(shell git describe --tags --abbrev=0 | awk -F. '{print $$1+1".0.0"}'))
	npm --no-git-tag-version version $(MAJORVERSION)
	cd electron && npm --no-git-tag-version version $(MAJORVERSION)

	$(eval ANDROID_VERSION_CODE=$(shell grep versionCode android/app/build.gradle | awk '{print $$2+1}'))
	sed -i.bak 's/versionCode .*/versionCode ${ANDROID_VERSION_CODE}/g' android/app/build.gradle
	sed -i.bak 's/versionName .*/versionName "${MAJORVERSION}"/g' android/app/build.gradle
	rm -f android/app/build.gradle.bak

	$(eval IOS_CF_BUNDLE_VERSION=$(shell /usr/libexec/PlistBuddy -c "Print CFBundleVersion" ios/App/App/Info.plist))
	$(eval IOS_CF_BUNDLE_VERSION=$(shell echo $$(($(IOS_CF_BUNDLE_VERSION)+1))))
	/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${IOS_CF_BUNDLE_VERSION}" ios/App/App/Info.plist
	sed -i.bak 's/MARKETING_VERSION = .*/MARKETING_VERSION = ${MAJORVERSION};/g' ios/App/App.xcodeproj/project.pbxproj
	rm -f ios/App/App.xcodeproj/project.pbxproj.bak

	git add .
	git commit -m 'Prepare release $(MAJORVERSION)'
	git push
	git tag -a $(MAJORVERSION) -m 'Release $(MAJORVERSION)'
	git push origin --tags

release-minor:
	git checkout master
	git pull

	$(eval MINORVERSION=$(shell git describe --tags --abbrev=0 | awk -F. '{print $$1"."$$2+1".0"}'))
	npm --no-git-tag-version version $(MINORVERSION)
	cd electron && npm --no-git-tag-version version $(MINORVERSION)

	$(eval ANDROID_VERSION_CODE=$(shell grep versionCode android/app/build.gradle | awk '{print $$2+1}'))
	sed -i.bak 's/versionCode .*/versionCode ${ANDROID_VERSION_CODE}/g' android/app/build.gradle
	sed -i.bak 's/versionName .*/versionName "${MINORVERSION}"/g' android/app/build.gradle
	rm -f android/app/build.gradle.bak

	$(eval IOS_CF_BUNDLE_VERSION=$(shell /usr/libexec/PlistBuddy -c "Print CFBundleVersion" ios/App/App/Info.plist))
	$(eval IOS_CF_BUNDLE_VERSION=$(shell echo $$(($(IOS_CF_BUNDLE_VERSION)+1))))
	/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${IOS_CF_BUNDLE_VERSION}" ios/App/App/Info.plist
	sed -i.bak 's/MARKETING_VERSION = .*/MARKETING_VERSION = ${MINORVERSION};/g' ios/App/App.xcodeproj/project.pbxproj
	rm -f ios/App/App.xcodeproj/project.pbxproj.bak

	git add .
	git commit -m 'Prepare release $(MINORVERSION)'
	git push
	git tag -a $(MINORVERSION) -m 'Release $(MINORVERSION)'
	git push origin --tags

release-patch:
	git checkout master
	git pull

	# Do not use the last git tag to increase the patch version, because it is possible that the version number was
	# increased for a beta release.
	$(eval PATCHVERSION=$(shell cat ios/App/App.xcodeproj/project.pbxproj | grep MARKETING_VERSION | tail -n1 | awk '{print substr($$3, 1, length($$3)-1)}'))
	$(eval PATCHVERSION=$(shell echo "${PATCHVERSION}" | awk -F. '{print $$1"."$$2"."$$3+1}'))
	npm --no-git-tag-version version $(PATCHVERSION)
	cd electron && npm --no-git-tag-version version $(PATCHVERSION)

	$(eval ANDROID_VERSION_CODE=$(shell grep versionCode android/app/build.gradle | awk '{print $$2+1}'))
	sed -i.bak 's/versionCode .*/versionCode ${ANDROID_VERSION_CODE}/g' android/app/build.gradle
	sed -i.bak 's/versionName .*/versionName "${PATCHVERSION}"/g' android/app/build.gradle
	rm -f android/app/build.gradle.bak

	$(eval IOS_CF_BUNDLE_VERSION=$(shell /usr/libexec/PlistBuddy -c "Print CFBundleVersion" ios/App/App/Info.plist))
	$(eval IOS_CF_BUNDLE_VERSION=$(shell echo $$(($(IOS_CF_BUNDLE_VERSION)+1))))
	/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${IOS_CF_BUNDLE_VERSION}" ios/App/App/Info.plist
	sed -i.bak 's/MARKETING_VERSION = .*/MARKETING_VERSION = ${PATCHVERSION};/g' ios/App/App.xcodeproj/project.pbxproj
	rm -f ios/App/App.xcodeproj/project.pbxproj.bak

	git add .
	git commit -m 'Prepare release $(PATCHVERSION)'
	git push
	git tag -a $(PATCHVERSION) -m 'Release $(PATCHVERSION)'
	git push origin --tags
