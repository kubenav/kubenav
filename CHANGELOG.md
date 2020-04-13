# Changelog

## [1.4.0](https://github.com/kubenav/kubenav/tree/1.4.0) (2020-04-13)

[Full Changelog](https://github.com/kubenav/kubenav/compare/1.3.0...1.4.0)

**Implemented enhancements:**

- Feature: find in lists [\#49](https://github.com/kubenav/kubenav/issues/49)
- Ability to add IBM Cluster [\#48](https://github.com/kubenav/kubenav/issues/48)
- Add Support for OIDC [\#53](https://github.com/kubenav/kubenav/pull/53) ([ricoberger](https://github.com/ricoberger))
- Add searchbar for list views [\#51](https://github.com/kubenav/kubenav/pull/51) ([ricoberger](https://github.com/ricoberger))

**Closed issues:**

- User "system:anonymous" cannot list resource [\#31](https://github.com/kubenav/kubenav/issues/31)

## [1.3.0](https://github.com/kubenav/kubenav/tree/1.3.0) (2020-03-13)

[Full Changelog](https://github.com/kubenav/kubenav/compare/1.2.0...1.3.0)

**Implemented enhancements:**

- Import from Microsoft Azure [\#26](https://github.com/kubenav/kubenav/issues/26)
- Use host .kube/config file / kubectl command on Mac OS X [\#13](https://github.com/kubenav/kubenav/issues/13)
- Add Support for Microsoft Azure [\#46](https://github.com/kubenav/kubenav/pull/46) ([ricoberger](https://github.com/ricoberger))
- Appearance Customization \(Dark Mode + Editor Theme\) [\#43](https://github.com/kubenav/kubenav/pull/43) ([ricoberger](https://github.com/ricoberger))
- Improve pod and container view [\#42](https://github.com/kubenav/kubenav/pull/42) ([ricoberger](https://github.com/ricoberger))
- Add status information to list view [\#41](https://github.com/kubenav/kubenav/pull/41) ([ricoberger](https://github.com/ricoberger))
- Show namespace in list view [\#40](https://github.com/kubenav/kubenav/pull/40) ([ricoberger](https://github.com/ricoberger))
- Add nightly builds [\#33](https://github.com/kubenav/kubenav/pull/33) ([ricoberger](https://github.com/ricoberger))
- Use kubeconfig on desktop [\#25](https://github.com/kubenav/kubenav/pull/25) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- Importing AWS EKS cluster returns just one cluster [\#35](https://github.com/kubenav/kubenav/issues/35)
- Using kubeconfig from Rancher does not work [\#32](https://github.com/kubenav/kubenav/issues/32)
- Improve required data checks [\#47](https://github.com/kubenav/kubenav/pull/47) ([ricoberger](https://github.com/ricoberger))
- Multiple UI Fixes [\#45](https://github.com/kubenav/kubenav/pull/45) ([ricoberger](https://github.com/ricoberger))
- Fix logs modal for valid json [\#44](https://github.com/kubenav/kubenav/pull/44) ([ricoberger](https://github.com/ricoberger))
- Fix adding EKS and GKE clusters [\#36](https://github.com/kubenav/kubenav/pull/36) ([ricoberger](https://github.com/ricoberger))
- Fix status for init containers [\#24](https://github.com/kubenav/kubenav/pull/24) ([ricoberger](https://github.com/ricoberger))

**Closed issues:**

- User "system:anonymous" cannot list resource  [\#30](https://github.com/kubenav/kubenav/issues/30)
- Does this work on AWS EKS? [\#27](https://github.com/kubenav/kubenav/issues/27)

**Merged pull requests:**

- Restructuring III [\#39](https://github.com/kubenav/kubenav/pull/39) ([ricoberger](https://github.com/ricoberger))
- Add utils folder to repo [\#38](https://github.com/kubenav/kubenav/pull/38) ([ricoberger](https://github.com/ricoberger))
- Restructuring II [\#37](https://github.com/kubenav/kubenav/pull/37) ([ricoberger](https://github.com/ricoberger))
- Restructuring I [\#34](https://github.com/kubenav/kubenav/pull/34) ([ricoberger](https://github.com/ricoberger))
- Update Dependencies [\#23](https://github.com/kubenav/kubenav/pull/23) ([ricoberger](https://github.com/ricoberger))
- Increase width of modals for larger sized screens [\#22](https://github.com/kubenav/kubenav/pull/22) ([armandvanderwalt](https://github.com/armandvanderwalt))

## [1.2.0](https://github.com/kubenav/kubenav/tree/1.2.0) (2020-02-17)

[Full Changelog](https://github.com/kubenav/kubenav/compare/1.1.0...1.2.0)

**Implemented enhancements:**

- Can't add a GKE cluster [\#14](https://github.com/kubenav/kubenav/issues/14)
- feature request: "kubectl logs" [\#11](https://github.com/kubenav/kubenav/issues/11)
- Add support for GKE and EKS via OIDC [\#19](https://github.com/kubenav/kubenav/pull/19) ([ricoberger](https://github.com/ricoberger))
- Improve log handling [\#16](https://github.com/kubenav/kubenav/pull/16) ([ricoberger](https://github.com/ricoberger))
- Add support for basic authentication [\#15](https://github.com/kubenav/kubenav/pull/15) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- Add link to Google OAuth 2.0 configuration [\#21](https://github.com/kubenav/kubenav/pull/21) ([ricoberger](https://github.com/ricoberger))
- Fix add cluster overwrites existing clusters [\#12](https://github.com/kubenav/kubenav/pull/12) ([ricoberger](https://github.com/ricoberger))

**Closed issues:**

- Cannot edit a cluster [\#20](https://github.com/kubenav/kubenav/issues/20)
- Can't add microk8s config [\#18](https://github.com/kubenav/kubenav/issues/18)

**Merged pull requests:**

- Improve status check for clusters [\#17](https://github.com/kubenav/kubenav/pull/17) ([ricoberger](https://github.com/ricoberger))

## [1.1.0](https://github.com/kubenav/kubenav/tree/1.1.0) (2020-01-19)

[Full Changelog](https://github.com/kubenav/kubenav/compare/1.0.0...1.1.0)

**Implemented enhancements:**

- Create iOS Version [\#1](https://github.com/kubenav/kubenav/issues/1)
- Several UI fixed and improvements [\#8](https://github.com/kubenav/kubenav/pull/8) ([ricoberger](https://github.com/ricoberger))
- Improve Error Handling [\#7](https://github.com/kubenav/kubenav/pull/7) ([ricoberger](https://github.com/ricoberger))
- Add iOS Support [\#5](https://github.com/kubenav/kubenav/pull/5) ([ricoberger](https://github.com/ricoberger))
- Add linting [\#4](https://github.com/kubenav/kubenav/pull/4) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- Deletion of Pods doesn't work [\#2](https://github.com/kubenav/kubenav/issues/2)
- Improve native app builds [\#10](https://github.com/kubenav/kubenav/pull/10) ([ricoberger](https://github.com/ricoberger))
- Fix cluster management [\#9](https://github.com/kubenav/kubenav/pull/9) ([ricoberger](https://github.com/ricoberger))
- Add alternative cluster option for request method [\#6](https://github.com/kubenav/kubenav/pull/6) ([ricoberger](https://github.com/ricoberger))

**Merged pull requests:**

- Fix deletion and editing of resources on desktop [\#3](https://github.com/kubenav/kubenav/pull/3) ([ricoberger](https://github.com/ricoberger))

## [1.0.0](https://github.com/kubenav/kubenav/tree/1.0.0) (2020-01-05)

[Full Changelog](https://github.com/kubenav/kubenav/compare/637b2fee3b9a5812a151046163cdac254d6b3007...1.0.0)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
