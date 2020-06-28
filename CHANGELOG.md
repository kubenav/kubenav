# Changelog

## [2.1.0](https://github.com/kubenav/kubenav/tree/2.1.0) (2020-06-28)

[Full Changelog](https://github.com/kubenav/kubenav/compare/2.0.0...2.1.0)

**Implemented enhancements:**

- Add multi-arch for docker images [\#113](https://github.com/kubenav/kubenav/issues/113)
- Feature request: Docker image [\#107](https://github.com/kubenav/kubenav/issues/107)
- Import Kubeconfig via file [\#122](https://github.com/kubenav/kubenav/pull/122) ([ricoberger](https://github.com/ricoberger))
- Add support for PodDisruptionBudgets [\#121](https://github.com/kubenav/kubenav/pull/121) ([ricoberger](https://github.com/ricoberger))
- Show permissions for SA and Pods [\#117](https://github.com/kubenav/kubenav/pull/117) ([ricoberger](https://github.com/ricoberger))
- Add Docker support [\#110](https://github.com/kubenav/kubenav/pull/110) ([ricoberger](https://github.com/ricoberger))
- Code-sign macOS App [\#109](https://github.com/kubenav/kubenav/pull/109) ([ricoberger](https://github.com/ricoberger))
- Improve log and shell access [\#106](https://github.com/kubenav/kubenav/pull/106) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- unable to open releases properly on Mac [\#108](https://github.com/kubenav/kubenav/issues/108)
- Too many open files. [\#78](https://github.com/kubenav/kubenav/issues/78)
- Fix GitHub Action [\#104](https://github.com/kubenav/kubenav/pull/104) ([ricoberger](https://github.com/ricoberger))

**Closed issues:**

- Y [\#119](https://github.com/kubenav/kubenav/issues/119)
- Could not create Kubernetes API client [\#115](https://github.com/kubenav/kubenav/issues/115)

**Merged pull requests:**

- Fix flag parsing [\#118](https://github.com/kubenav/kubenav/pull/118) ([ricoberger](https://github.com/ricoberger))
- Add multi arch Docker images [\#116](https://github.com/kubenav/kubenav/pull/116) ([ricoberger](https://github.com/ricoberger))
- Add missing --- at the top in kubernetes/clusterrole.yaml [\#114](https://github.com/kubenav/kubenav/pull/114) ([mzac](https://github.com/mzac))
- Adjust code signing [\#112](https://github.com/kubenav/kubenav/pull/112) ([ricoberger](https://github.com/ricoberger))
- Fix GitHub Action for PRs [\#111](https://github.com/kubenav/kubenav/pull/111) ([ricoberger](https://github.com/ricoberger))
- Update dependencies [\#105](https://github.com/kubenav/kubenav/pull/105) ([ricoberger](https://github.com/ricoberger))

## [2.0.0](https://github.com/kubenav/kubenav/tree/2.0.0) (2020-06-15)

[Full Changelog](https://github.com/kubenav/kubenav/compare/1.4.1...2.0.0)

**Implemented enhancements:**

- \[feature request\] display which cluster \(context\) and namespace currently being viewed [\#98](https://github.com/kubenav/kubenav/issues/98)
- Improvement: Show Deployments yellow if... [\#81](https://github.com/kubenav/kubenav/issues/81)
- Improvement: Scale Deployment [\#80](https://github.com/kubenav/kubenav/issues/80)
- Viewing container logs [\#60](https://github.com/kubenav/kubenav/issues/60)
- not support insecure-skip-verify   [\#58](https://github.com/kubenav/kubenav/issues/58)
- Beta testing ios? [\#57](https://github.com/kubenav/kubenav/issues/57)
- Error on macos [\#52](https://github.com/kubenav/kubenav/issues/52)
- Feature: Set as current Cluster [\#50](https://github.com/kubenav/kubenav/issues/50)
- Support self signed certificates for OIDC [\#102](https://github.com/kubenav/kubenav/pull/102) ([ricoberger](https://github.com/ricoberger))
- Improve context switch [\#99](https://github.com/kubenav/kubenav/pull/99) ([ricoberger](https://github.com/ricoberger))
- Add Storage Class [\#89](https://github.com/kubenav/kubenav/pull/89) ([ricoberger](https://github.com/ricoberger))
- Add Resources [\#88](https://github.com/kubenav/kubenav/pull/88) ([ricoberger](https://github.com/ricoberger))
- Add search function for terminal and logs [\#77](https://github.com/kubenav/kubenav/pull/77) ([ricoberger](https://github.com/ricoberger))
- Improve CRD Support [\#76](https://github.com/kubenav/kubenav/pull/76) ([ricoberger](https://github.com/ricoberger))
- Support multiple Kubeconfig files [\#75](https://github.com/kubenav/kubenav/pull/75) ([ricoberger](https://github.com/ricoberger))
- Sync changes back to loaded Kubeconfig file [\#72](https://github.com/kubenav/kubenav/pull/72) ([ricoberger](https://github.com/ricoberger))
- Add support to stream logs [\#71](https://github.com/kubenav/kubenav/pull/71) ([ricoberger](https://github.com/ricoberger))
- Change namespace via edit cluster modal [\#70](https://github.com/kubenav/kubenav/pull/70) ([ricoberger](https://github.com/ricoberger))
- Add terminal support [\#68](https://github.com/kubenav/kubenav/pull/68) ([ricoberger](https://github.com/ricoberger))
- Add version check [\#65](https://github.com/kubenav/kubenav/pull/65) ([ricoberger](https://github.com/ricoberger))
- Update Capacitor to version 2 [\#64](https://github.com/kubenav/kubenav/pull/64) ([ricoberger](https://github.com/ricoberger))
- Remove kubenav-plugin Dependency [\#63](https://github.com/kubenav/kubenav/pull/63) ([ricoberger](https://github.com/ricoberger))
- Support insecure-skip-tls-verify and timeout [\#59](https://github.com/kubenav/kubenav/pull/59) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- \[bug\] parsing KUBECONFIG environment variable containing multiple files [\#100](https://github.com/kubenav/kubenav/issues/100)
- cluster role bindings generates blank white page [\#95](https://github.com/kubenav/kubenav/issues/95)
- ports listed under services are incorrectly displayed [\#93](https://github.com/kubenav/kubenav/issues/93)
- Could not connect to AWS EKS using token/username password [\#90](https://github.com/kubenav/kubenav/issues/90)
- Losses connect if don't do anything in a period. [\#85](https://github.com/kubenav/kubenav/issues/85)
- Loadbalancer external IP address isn't shown [\#83](https://github.com/kubenav/kubenav/issues/83)
- Incorrect page displayed. [\#79](https://github.com/kubenav/kubenav/issues/79)
- Update ServiceDetails.tsx [\#94](https://github.com/kubenav/kubenav/pull/94) ([si458](https://github.com/si458))

**Closed issues:**

- \[feature request\] add Endpoints [\#96](https://github.com/kubenav/kubenav/issues/96)
- Ability to change default namespace without namespace permission [\#67](https://github.com/kubenav/kubenav/issues/67)
- fresh install cant add new cluster mac [\#62](https://github.com/kubenav/kubenav/issues/62)
- Could not connect to aws eks using token [\#61](https://github.com/kubenav/kubenav/issues/61)

**Merged pull requests:**

- Improve desktop menu [\#103](https://github.com/kubenav/kubenav/pull/103) ([ricoberger](https://github.com/ricoberger))
- Fix Kubeconfig handling [\#101](https://github.com/kubenav/kubenav/pull/101) ([ricoberger](https://github.com/ricoberger))
- Fix \(Cluster\) Role Bindings [\#97](https://github.com/kubenav/kubenav/pull/97) ([ricoberger](https://github.com/ricoberger))
- Restart server for API requests on mobile [\#92](https://github.com/kubenav/kubenav/pull/92) ([ricoberger](https://github.com/ricoberger))
- Adjust documentation [\#91](https://github.com/kubenav/kubenav/pull/91) ([ricoberger](https://github.com/ricoberger))
- Refactor Cloud Providers [\#87](https://github.com/kubenav/kubenav/pull/87) ([ricoberger](https://github.com/ricoberger))
- Add menu for details page [\#86](https://github.com/kubenav/kubenav/pull/86) ([ricoberger](https://github.com/ricoberger))
- Improve rendering [\#82](https://github.com/kubenav/kubenav/pull/82) ([ricoberger](https://github.com/ricoberger))
- Improve terminal handling [\#74](https://github.com/kubenav/kubenav/pull/74) ([ricoberger](https://github.com/ricoberger))
- Improve setup [\#73](https://github.com/kubenav/kubenav/pull/73) ([ricoberger](https://github.com/ricoberger))
- Rework request logic for mobile [\#69](https://github.com/kubenav/kubenav/pull/69) ([ricoberger](https://github.com/ricoberger))
- Migrate from TSLint to ESLint [\#66](https://github.com/kubenav/kubenav/pull/66) ([ricoberger](https://github.com/ricoberger))

## [1.4.1](https://github.com/kubenav/kubenav/tree/1.4.1) (2020-04-14)

[Full Changelog](https://github.com/kubenav/kubenav/compare/1.4.0...1.4.1)

**Fixed bugs:**

- Fix OIDC support for desktop [\#56](https://github.com/kubenav/kubenav/pull/56) ([ricoberger](https://github.com/ricoberger))
- Check if authProvider property exists on cluster [\#55](https://github.com/kubenav/kubenav/pull/55) ([ricoberger](https://github.com/ricoberger))
- Fix Kubeconfig validation [\#54](https://github.com/kubenav/kubenav/pull/54) ([ricoberger](https://github.com/ricoberger))

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
