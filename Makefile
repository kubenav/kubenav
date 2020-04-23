.PHONY: release-beta release-major release-minor release-patch

release-beta:
	git checkout master
	git pull

	$(eval ANDROID_VERSION_CODE=$(shell grep versionCode android/app/build.gradle | awk '{print $$2+1}'))
	sed -i.bak 's/versionCode .*/versionCode ${ANDROID_VERSION_CODE}/g' android/app/build.gradle
	rm -f android/app/build.gradle.bak

	$(eval IOS_CF_BUNDLE_VERSION=$(shell /usr/libexec/PlistBuddy -c "Print CFBundleVersion" ios/App/App/Info.plist))
	$(eval IOS_CF_BUNDLE_VERSION=$(shell echo $$(($(IOS_CF_BUNDLE_VERSION)+1))))
	/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${IOS_CF_BUNDLE_VERSION}" ios/App/App/Info.plist

	git add .
	git commit -m 'Prepare beta release'
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

	$(eval PATCHVERSION=$(shell git describe --tags --abbrev=0 | awk -F. '{print $$1"."$$2"."$$3+1}'))
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
