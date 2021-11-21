# Changelog

## [3.8.0](https://github.com/kubenav/kubenav/tree/3.8.0) (2021-11-21)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.7.2...3.8.0)

**Implemented enhancements:**

- Feature request - More insight into nodes in desktop client [\#348](https://github.com/kubenav/kubenav/issues/348)
- Building image on s390x plataform [\#316](https://github.com/kubenav/kubenav/issues/316)
- Use namespace from kubeconfig during import [\#354](https://github.com/kubenav/kubenav/pull/354) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- not able to open the file picker on Android 12 to import a kubeconfig [\#353](https://github.com/kubenav/kubenav/issues/353)
- Fix iOS build for Go 1.17 [\#347](https://github.com/kubenav/kubenav/pull/347) ([ricoberger](https://github.com/ricoberger))

**Closed issues:**

- Android client not importing kube config file [\#360](https://github.com/kubenav/kubenav/issues/360)
- Add support for crd [\#349](https://github.com/kubenav/kubenav/issues/349)
- Cannot get Port forwarding  to work [\#342](https://github.com/kubenav/kubenav/issues/342)

**Merged pull requests:**

- Use in-app browser to open links [\#359](https://github.com/kubenav/kubenav/pull/359) ([ricoberger](https://github.com/ricoberger))
- Update to Capacitor 3 [\#355](https://github.com/kubenav/kubenav/pull/355) ([ricoberger](https://github.com/ricoberger))
- Show node metrics in overview [\#352](https://github.com/kubenav/kubenav/pull/352) ([ricoberger](https://github.com/ricoberger))
- Allow use HTTP in URL with manual cluster [\#351](https://github.com/kubenav/kubenav/pull/351) ([PtilopsisLeucotis](https://github.com/PtilopsisLeucotis))
- Add support for linux/s390x [\#317](https://github.com/kubenav/kubenav/pull/317) ([ricoberger](https://github.com/ricoberger))

## [3.7.2](https://github.com/kubenav/kubenav/tree/3.7.2) (2021-09-20)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.7.1...3.7.2)

**Implemented enhancements:**

- Add support for Kubernetes 1.22 [\#346](https://github.com/kubenav/kubenav/pull/346) ([ricoberger](https://github.com/ricoberger))

**Closed issues:**

- k8s 1.22 support [\#345](https://github.com/kubenav/kubenav/issues/345)

## [3.7.1](https://github.com/kubenav/kubenav/tree/3.7.1) (2021-08-25)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.7.0...3.7.1)

**Breaking changes:**

- Remove camera and photo library access on iOS [\#341](https://github.com/kubenav/kubenav/pull/341) ([ricoberger](https://github.com/ricoberger))

**Closed issues:**

- Not able to load kubeconfig on iOS [\#343](https://github.com/kubenav/kubenav/issues/343)

## [3.7.0](https://github.com/kubenav/kubenav/tree/3.7.0) (2021-08-03)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.6.0...3.7.0)

**Implemented enhancements:**

- Add force delete option [\#337](https://github.com/kubenav/kubenav/pull/337) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- Unable to add multiple Azure AKS clusters [\#324](https://github.com/kubenav/kubenav/issues/324)
- Fix time range selection in Prometheus charts [\#340](https://github.com/kubenav/kubenav/pull/340) ([ricoberger](https://github.com/ricoberger))

**Merged pull requests:**

- Remove resource group for Azure [\#339](https://github.com/kubenav/kubenav/pull/339) ([ricoberger](https://github.com/ricoberger))
- Update Go and JaveScript dependencies [\#338](https://github.com/kubenav/kubenav/pull/338) ([ricoberger](https://github.com/ricoberger))

## [3.6.0](https://github.com/kubenav/kubenav/tree/3.6.0) (2021-06-11)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.5.0...3.6.0)

**Implemented enhancements:**

- JSON editor [\#333](https://github.com/kubenav/kubenav/issues/333)
- Add support for OAuth2 PKCE [\#331](https://github.com/kubenav/kubenav/pull/331) ([lukasmoellerch](https://github.com/lukasmoellerch))

**Closed issues:**

- Can't run on macOS [\#335](https://github.com/kubenav/kubenav/issues/335)

**Merged pull requests:**

- Fix OIDC PKCE [\#336](https://github.com/kubenav/kubenav/pull/336) ([lukasmoellerch](https://github.com/lukasmoellerch))
- Add json editor [\#334](https://github.com/kubenav/kubenav/pull/334) ([ricoberger](https://github.com/ricoberger))

## [3.5.0](https://github.com/kubenav/kubenav/tree/3.5.0) (2021-05-09)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.4.1...3.5.0)

**Implemented enhancements:**

- kubeconfig import from Rancher [\#311](https://github.com/kubenav/kubenav/issues/311)
- F-Droid [\#298](https://github.com/kubenav/kubenav/issues/298)

**Fixed bugs:**

- MacOS amd64 does not start [\#321](https://github.com/kubenav/kubenav/issues/321)

**Closed issues:**

- Feature Request: Filter in namespace dropdown [\#327](https://github.com/kubenav/kubenav/issues/327)
- Kubernetes API request failed error="unexpected end of JSON input" in Ubuntu and Android [\#319](https://github.com/kubenav/kubenav/issues/319)

**Merged pull requests:**

- Rancher import improvements [\#330](https://github.com/kubenav/kubenav/pull/330) ([jbravo94](https://github.com/jbravo94))
- Namespaces: Add filter bar [\#328](https://github.com/kubenav/kubenav/pull/328) ([scthi](https://github.com/scthi))
- Adds kubeconfig import from Rancher [\#323](https://github.com/kubenav/kubenav/pull/323) ([jbravo94](https://github.com/jbravo94))
- Fix flag parsing for macOS [\#322](https://github.com/kubenav/kubenav/pull/322) ([ricoberger](https://github.com/ricoberger))
- Update Go and React dependencies [\#320](https://github.com/kubenav/kubenav/pull/320) ([ricoberger](https://github.com/ricoberger))

## [3.4.1](https://github.com/kubenav/kubenav/tree/3.4.1) (2021-03-24)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.4.0...3.4.1)

**Implemented enhancements:**

- Add new AWS regions [\#307](https://github.com/kubenav/kubenav/pull/307) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- Windows release doesn't start on Win 10 Pro 19043 [\#310](https://github.com/kubenav/kubenav/issues/310)

**Closed issues:**

- componentstatus is deprecated  [\#302](https://github.com/kubenav/kubenav/issues/302)

**Merged pull requests:**

- Remove Component Status [\#318](https://github.com/kubenav/kubenav/pull/318) ([ricoberger](https://github.com/ricoberger))
- Update Go version to 1.16 [\#314](https://github.com/kubenav/kubenav/pull/314) ([ricoberger](https://github.com/ricoberger))
- Rework flag handling [\#313](https://github.com/kubenav/kubenav/pull/313) ([ricoberger](https://github.com/ricoberger))
- Preparation for F-Droid [\#312](https://github.com/kubenav/kubenav/pull/312) ([ricoberger](https://github.com/ricoberger))
- Add events timestamp [\#309](https://github.com/kubenav/kubenav/pull/309) ([matthiastz](https://github.com/matthiastz))

## [3.4.0](https://github.com/kubenav/kubenav/tree/3.4.0) (2021-03-01)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.3.0...3.4.0)

**Implemented enhancements:**

- Ability to specify extra scopes for OIDC [\#303](https://github.com/kubenav/kubenav/issues/303)

**Fixed bugs:**

- BUG: js-yaml edit error in latest builds [\#301](https://github.com/kubenav/kubenav/issues/301)
- Fix edit cluster modal for cloud providers [\#299](https://github.com/kubenav/kubenav/pull/299) ([ricoberger](https://github.com/ricoberger))
- Update build.yml [\#295](https://github.com/kubenav/kubenav/pull/295) ([si458](https://github.com/si458))

**Closed issues:**

- README Language updates [\#305](https://github.com/kubenav/kubenav/issues/305)

**Merged pull requests:**

- Fix typos in the Readme [\#306](https://github.com/kubenav/kubenav/pull/306) ([ricoberger](https://github.com/ricoberger))
- Allow additional OIDC scopes [\#304](https://github.com/kubenav/kubenav/pull/304) ([ricoberger](https://github.com/ricoberger))
- Update dependencies [\#300](https://github.com/kubenav/kubenav/pull/300) ([ricoberger](https://github.com/ricoberger))
- Improve default metrics [\#296](https://github.com/kubenav/kubenav/pull/296) ([ricoberger](https://github.com/ricoberger))

## [3.3.0](https://github.com/kubenav/kubenav/tree/3.3.0) (2021-01-03)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.2.1...3.3.0)

**Implemented enhancements:**

- Feature: create arm and arm64 builds [\#282](https://github.com/kubenav/kubenav/issues/282)
- Feature: filter services \(loadbalancer, clusterip, etc\) [\#272](https://github.com/kubenav/kubenav/issues/272)
- Add Jaeger Plugin [\#289](https://github.com/kubenav/kubenav/pull/289) ([ricoberger](https://github.com/ricoberger))
- Visualize log count in Elasticsearch plugin [\#285](https://github.com/kubenav/kubenav/pull/285) ([ricoberger](https://github.com/ricoberger))
- Improve Plugins [\#280](https://github.com/kubenav/kubenav/pull/280) ([ricoberger](https://github.com/ricoberger))
- Add Elasticsearch plugin [\#279](https://github.com/kubenav/kubenav/pull/279) ([ricoberger](https://github.com/ricoberger))
- Add support for dashboards [\#276](https://github.com/kubenav/kubenav/pull/276) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- BUG: can’t scroll info panel on iOS [\#293](https://github.com/kubenav/kubenav/issues/293)
- BUG: unable to run latest schedule builds as REQUIRES Mac 11 [\#291](https://github.com/kubenav/kubenav/issues/291)
- bug: weird port forward delay with firefox [\#284](https://github.com/kubenav/kubenav/issues/284)
- Issue with prometheus configuration [\#278](https://github.com/kubenav/kubenav/issues/278)
- Bug: overview page blank if no cluster connection [\#274](https://github.com/kubenav/kubenav/issues/274)

**Closed issues:**

- Unable to connect to node \(failed to find pem in certificate input\) [\#290](https://github.com/kubenav/kubenav/issues/290)
- unexpected end of json input  [\#275](https://github.com/kubenav/kubenav/issues/275)

**Merged pull requests:**

- Fix scrolling for info page [\#294](https://github.com/kubenav/kubenav/pull/294) ([ricoberger](https://github.com/ricoberger))
- fix-mac-10.15-build [\#292](https://github.com/kubenav/kubenav/pull/292) ([si458](https://github.com/si458))
- Update GitHub Actions [\#288](https://github.com/kubenav/kubenav/pull/288) ([ricoberger](https://github.com/ricoberger))
- Fix port forwarding [\#287](https://github.com/kubenav/kubenav/pull/287) ([ricoberger](https://github.com/ricoberger))
- Add support for linux-arm and linux-arm64 [\#286](https://github.com/kubenav/kubenav/pull/286) ([ricoberger](https://github.com/ricoberger))
- update electron to latest version [\#283](https://github.com/kubenav/kubenav/pull/283) ([si458](https://github.com/si458))
- Remove job label from Prometheus metrics [\#281](https://github.com/kubenav/kubenav/pull/281) ([ricoberger](https://github.com/ricoberger))
- Show error message on overview page [\#277](https://github.com/kubenav/kubenav/pull/277) ([ricoberger](https://github.com/ricoberger))
- Add advanced search functions [\#273](https://github.com/kubenav/kubenav/pull/273) ([ricoberger](https://github.com/ricoberger))
- Improve port forwarding [\#270](https://github.com/kubenav/kubenav/pull/270) ([ricoberger](https://github.com/ricoberger))

## [3.2.1](https://github.com/kubenav/kubenav/tree/3.2.1) (2020-12-02)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.2.0...3.2.1)

**Fixed bugs:**

- Unexpected JSON error when logging in with GKE on Android [\#267](https://github.com/kubenav/kubenav/issues/267)
- "Esc" not work with shell [\#265](https://github.com/kubenav/kubenav/issues/265)
- Bug: authentication enabled still requires clicking sign in to open prompt [\#264](https://github.com/kubenav/kubenav/issues/264)
- Bug: android in landscape mode hides login button [\#263](https://github.com/kubenav/kubenav/issues/263)

**Merged pull requests:**

- Fix bugs regarding authentication [\#269](https://github.com/kubenav/kubenav/pull/269) ([ricoberger](https://github.com/ricoberger))
- Fix rederict for Google and OIDC [\#268](https://github.com/kubenav/kubenav/pull/268) ([ricoberger](https://github.com/ricoberger))
- typo fix [\#266](https://github.com/kubenav/kubenav/pull/266) ([dbaker-rh](https://github.com/dbaker-rh))

## [3.2.0](https://github.com/kubenav/kubenav/tree/3.2.0) (2020-11-28)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.1.0...3.2.0)

**Implemented enhancements:**

- Bug: new authentication plugin has no fallover/retry option [\#255](https://github.com/kubenav/kubenav/issues/255)
- Feature Request: filter events [\#248](https://github.com/kubenav/kubenav/issues/248)
- AWS SSO authentication [\#239](https://github.com/kubenav/kubenav/issues/239)
- Add tooltip for charts [\#259](https://github.com/kubenav/kubenav/pull/259) ([ricoberger](https://github.com/ricoberger))
- Add authentication support for mobile app [\#253](https://github.com/kubenav/kubenav/pull/253) ([ricoberger](https://github.com/ricoberger))
- Add support for DigitalOcean [\#252](https://github.com/kubenav/kubenav/pull/252) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- kubenav does not have version numbers on macOS [\#260](https://github.com/kubenav/kubenav/issues/260)
- Bug: edit option showing wrong yaml? [\#250](https://github.com/kubenav/kubenav/issues/250)
- kubenav doesn’t show all helm releases [\#245](https://github.com/kubenav/kubenav/issues/245)
- Bug: click open on port foward opens in app on mobile [\#242](https://github.com/kubenav/kubenav/issues/242)

**Closed issues:**

- Bug: blank white screen after selecting service, deployment then service again [\#251](https://github.com/kubenav/kubenav/issues/251)
- BUG: big charts on large tablet [\#244](https://github.com/kubenav/kubenav/issues/244)

**Merged pull requests:**

- Improve Docker image and add logging [\#262](https://github.com/kubenav/kubenav/pull/262) ([ricoberger](https://github.com/ricoberger))
- Add version for macOS implementation [\#261](https://github.com/kubenav/kubenav/pull/261) ([ricoberger](https://github.com/ricoberger))
- Improve authentication [\#256](https://github.com/kubenav/kubenav/pull/256) ([ricoberger](https://github.com/ricoberger))
- Improve event handling [\#249](https://github.com/kubenav/kubenav/pull/249) ([ricoberger](https://github.com/ricoberger))
- Add setting for the query limit [\#247](https://github.com/kubenav/kubenav/pull/247) ([ricoberger](https://github.com/ricoberger))
- Add support for AWS SSO [\#246](https://github.com/kubenav/kubenav/pull/246) ([ricoberger](https://github.com/ricoberger))

## [3.1.0](https://github.com/kubenav/kubenav/tree/3.1.0) (2020-10-28)

[Full Changelog](https://github.com/kubenav/kubenav/compare/3.0.0...3.1.0)

**Implemented enhancements:**

- Feature Request: list installed helm applications in cluster  [\#238](https://github.com/kubenav/kubenav/issues/238)
- Feature Request: add shortcut for fullscreen mode [\#227](https://github.com/kubenav/kubenav/issues/227)
- Feature Request: new overview charts are cool, maybe show on per node too? [\#223](https://github.com/kubenav/kubenav/issues/223)
- Feature Request: an add option to each of the sections [\#212](https://github.com/kubenav/kubenav/issues/212)
- Feature Request: Custom Shortcut/Pins for CRD or General [\#160](https://github.com/kubenav/kubenav/issues/160)
- Create Job from CronJob [\#230](https://github.com/kubenav/kubenav/pull/230) ([ricoberger](https://github.com/ricoberger))
- Add possibility to disable Pod metrics in list view [\#225](https://github.com/kubenav/kubenav/pull/225) ([ricoberger](https://github.com/ricoberger))
- Add cluster overview page [\#221](https://github.com/kubenav/kubenav/pull/221) ([ricoberger](https://github.com/ricoberger))
- Close item options and popovers after selection [\#211](https://github.com/kubenav/kubenav/pull/211) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- BUG: namespaces arent refreshed in dropdown selector [\#235](https://github.com/kubenav/kubenav/issues/235)
- Bug: when editing a configmap on iPad, the panel isn’t resized when keyboard closed [\#222](https://github.com/kubenav/kubenav/issues/222)
- Bug: scale deloyment to 0 doesnt wipe pods panel on refresh [\#218](https://github.com/kubenav/kubenav/issues/218)
- Bug: long pod name makes terminal/log panel unable to close tab [\#213](https://github.com/kubenav/kubenav/issues/213)
- Bug: scale a deployment to 0 when already 0 generates an error [\#207](https://github.com/kubenav/kubenav/issues/207)
- Bug: resize of terminal window on mobile doesn’t resize if open in split view [\#202](https://github.com/kubenav/kubenav/issues/202)

**Closed issues:**

- Bug: bug with selecting revision in helm [\#243](https://github.com/kubenav/kubenav/issues/243)
- BUG: click deployment and seems to show all pods? [\#237](https://github.com/kubenav/kubenav/issues/237)
- Feature Request: extra info for pods like restart reason and time [\#232](https://github.com/kubenav/kubenav/issues/232)
- Bug: its possible cluster doesnt have metrics installed [\#228](https://github.com/kubenav/kubenav/issues/228)

**Merged pull requests:**

- Add Helm Plugin [\#241](https://github.com/kubenav/kubenav/pull/241) ([ricoberger](https://github.com/ricoberger))
- Refetch namespaces when list is shown [\#236](https://github.com/kubenav/kubenav/pull/236) ([ricoberger](https://github.com/ricoberger))
- Add support for creating manifests [\#234](https://github.com/kubenav/kubenav/pull/234) ([ricoberger](https://github.com/ricoberger))
- a few go and npm package updates [\#233](https://github.com/kubenav/kubenav/pull/233) ([si458](https://github.com/si458))
- Add shortcut to toggle full screen [\#231](https://github.com/kubenav/kubenav/pull/231) ([ricoberger](https://github.com/ricoberger))
- Disable cluster and node metrics [\#229](https://github.com/kubenav/kubenav/pull/229) ([ricoberger](https://github.com/ricoberger))
- Parse Kubeconfig containing OIDC Provider [\#226](https://github.com/kubenav/kubenav/pull/226) ([ricoberger](https://github.com/ricoberger))
- Improve overview page [\#224](https://github.com/kubenav/kubenav/pull/224) ([ricoberger](https://github.com/ricoberger))
- Refresh list in details view [\#220](https://github.com/kubenav/kubenav/pull/220) ([ricoberger](https://github.com/ricoberger))
- Add support for bookmarks [\#219](https://github.com/kubenav/kubenav/pull/219) ([ricoberger](https://github.com/ricoberger))
- Prepare support for bookmarks [\#217](https://github.com/kubenav/kubenav/pull/217) ([ricoberger](https://github.com/ricoberger))
- Enable code scanning [\#216](https://github.com/kubenav/kubenav/pull/216) ([ricoberger](https://github.com/ricoberger))
- Fix terminal tabs for long container names [\#215](https://github.com/kubenav/kubenav/pull/215) ([ricoberger](https://github.com/ricoberger))
- Fix terminal window resizing [\#210](https://github.com/kubenav/kubenav/pull/210) ([ricoberger](https://github.com/ricoberger))
- Fix error while scale replicas [\#209](https://github.com/kubenav/kubenav/pull/209) ([ricoberger](https://github.com/ricoberger))

## [3.0.0](https://github.com/kubenav/kubenav/tree/3.0.0) (2020-09-27)

[Full Changelog](https://github.com/kubenav/kubenav/compare/2.2.0...3.0.0)

**Breaking changes:**

- Use cobra for command and flag parsing [\#154](https://github.com/kubenav/kubenav/pull/154) ([ricoberger](https://github.com/ricoberger))
- Rework cluster configuration [\#135](https://github.com/kubenav/kubenav/pull/135) ([ricoberger](https://github.com/ricoberger))

**Implemented enhancements:**

- feature request: hover tool tips for usage columns [\#199](https://github.com/kubenav/kubenav/issues/199)
- Feature Request: app crashes if too many events try to be listed [\#178](https://github.com/kubenav/kubenav/issues/178)
- Feature Request: export/save yaml to file [\#177](https://github.com/kubenav/kubenav/issues/177)
- Feature Request: use either bash or sh for terminal sessions [\#172](https://github.com/kubenav/kubenav/issues/172)
- Feature request: Auto dark mode [\#167](https://github.com/kubenav/kubenav/issues/167)
- Feature Request: font size of log window [\#161](https://github.com/kubenav/kubenav/issues/161)
- feature request: Close button on tab Logs [\#157](https://github.com/kubenav/kubenav/issues/157)
- feature request: auto refresh pages automatically [\#153](https://github.com/kubenav/kubenav/issues/153)
- feature request: portforward for pods/services [\#152](https://github.com/kubenav/kubenav/issues/152)
- add options to use a proxy [\#140](https://github.com/kubenav/kubenav/issues/140)
- Add status for PVs and PVCs [\#171](https://github.com/kubenav/kubenav/pull/171) ([ricoberger](https://github.com/ricoberger))
- Add Prometheus Plugin [\#169](https://github.com/kubenav/kubenav/pull/169) ([ricoberger](https://github.com/ricoberger))
- Add Support for Port-Forwarding [\#156](https://github.com/kubenav/kubenav/pull/156) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- BUG: selecting a longhorn crd generates a blank white screen [\#182](https://github.com/kubenav/kubenav/issues/182)
- Bug: port-forward for grafana service uses wrong port [\#179](https://github.com/kubenav/kubenav/issues/179)
- Missing log/terminal headers on mobile [\#166](https://github.com/kubenav/kubenav/issues/166)
- new ionrange sliders look squashed on laptop [\#164](https://github.com/kubenav/kubenav/issues/164)
- pods/events section on deployments arent refreshed when clicking refresh button [\#148](https://github.com/kubenav/kubenav/issues/148)
- after changing namespace 5 times via quick menu, the app locks up? [\#143](https://github.com/kubenav/kubenav/issues/143)
- clicking links opens up another electron window instead of default browser [\#141](https://github.com/kubenav/kubenav/issues/141)
- Bug: No OIDC re-authentication when refresh token is expired [\#136](https://github.com/kubenav/kubenav/issues/136)
- Fix permissions table [\#155](https://github.com/kubenav/kubenav/pull/155) ([ricoberger](https://github.com/ricoberger))

**Closed issues:**

- BUG: pod container details panel vanished? [\#196](https://github.com/kubenav/kubenav/issues/196)
- BUG: auto-refresh bugs [\#194](https://github.com/kubenav/kubenav/issues/194)
- Donation links [\#174](https://github.com/kubenav/kubenav/issues/174)
- going back a page doesnt refresh the old page until refresh clicked [\#173](https://github.com/kubenav/kubenav/issues/173)
- Why $HOME/.kube/.config [\#170](https://github.com/kubenav/kubenav/issues/170)

**Merged pull requests:**

- include protocol in port label in container details [\#206](https://github.com/kubenav/kubenav/pull/206) ([si458](https://github.com/si458))
- Final preparations for 3.0.0 release [\#205](https://github.com/kubenav/kubenav/pull/205) ([ricoberger](https://github.com/ricoberger))
- add port protocols to poddetails [\#203](https://github.com/kubenav/kubenav/pull/203) ([si458](https://github.com/si458))
- Add donation links for GitHub Sponsors and Paypal [\#201](https://github.com/kubenav/kubenav/pull/201) ([ricoberger](https://github.com/ricoberger))
- Add tooltip for container resource usage [\#200](https://github.com/kubenav/kubenav/pull/200) ([ricoberger](https://github.com/ricoberger))
- Container Details and Prometheus Dashboards [\#198](https://github.com/kubenav/kubenav/pull/198) ([ricoberger](https://github.com/ricoberger))
- Various fixes and improvements [\#195](https://github.com/kubenav/kubenav/pull/195) ([ricoberger](https://github.com/ricoberger))
- Support Prometheus metrics for several resources [\#192](https://github.com/kubenav/kubenav/pull/192) ([ricoberger](https://github.com/ricoberger))
- Use Prometheus query for variable values [\#191](https://github.com/kubenav/kubenav/pull/191) ([ricoberger](https://github.com/ricoberger))
- Infinite scrolling and automatic refetching of data [\#189](https://github.com/kubenav/kubenav/pull/189) ([ricoberger](https://github.com/ricoberger))
- Rework the logic to fetch data [\#188](https://github.com/kubenav/kubenav/pull/188) ([ricoberger](https://github.com/ricoberger))
- Support automatic theme changing [\#187](https://github.com/kubenav/kubenav/pull/187) ([ricoberger](https://github.com/ricoberger))
- Several small fixes and improvements [\#185](https://github.com/kubenav/kubenav/pull/185) ([ricoberger](https://github.com/ricoberger))
- Improve Prometheus Plugin [\#184](https://github.com/kubenav/kubenav/pull/184) ([ricoberger](https://github.com/ricoberger))
- Restructure React Components [\#183](https://github.com/kubenav/kubenav/pull/183) ([ricoberger](https://github.com/ricoberger))
- Fix port forwarding for services with target port [\#181](https://github.com/kubenav/kubenav/pull/181) ([ricoberger](https://github.com/ricoberger))
- Clean up frontend [\#180](https://github.com/kubenav/kubenav/pull/180) ([ricoberger](https://github.com/ricoberger))
- Rework Go Code [\#176](https://github.com/kubenav/kubenav/pull/176) ([ricoberger](https://github.com/ricoberger))
- Add option to select shell for terminal [\#175](https://github.com/kubenav/kubenav/pull/175) ([ricoberger](https://github.com/ricoberger))
- Fix terminal tabs for mobile devices [\#168](https://github.com/kubenav/kubenav/pull/168) ([ricoberger](https://github.com/ricoberger))
- Update npm packages [\#165](https://github.com/kubenav/kubenav/pull/165) ([ricoberger](https://github.com/ricoberger))
- Use IonRange in settings [\#163](https://github.com/kubenav/kubenav/pull/163) ([ricoberger](https://github.com/ricoberger))
- Add Terminal settings, disable port forwarding, customize cluster name [\#162](https://github.com/kubenav/kubenav/pull/162) ([ricoberger](https://github.com/ricoberger))
- Add close button to terminal tabs [\#159](https://github.com/kubenav/kubenav/pull/159) ([ricoberger](https://github.com/ricoberger))
- Fix namespace switching bug for Electron [\#151](https://github.com/kubenav/kubenav/pull/151) ([ricoberger](https://github.com/ricoberger))
- Refresh lists when details page is refreshed [\#150](https://github.com/kubenav/kubenav/pull/150) ([ricoberger](https://github.com/ricoberger))
- Update deployment.yaml [\#149](https://github.com/kubenav/kubenav/pull/149) ([si458](https://github.com/si458))
- Add re-authentication support for OIDC and Google [\#147](https://github.com/kubenav/kubenav/pull/147) ([ricoberger](https://github.com/ricoberger))
- Open links from Electron in external browser [\#146](https://github.com/kubenav/kubenav/pull/146) ([ricoberger](https://github.com/ricoberger))
- Add debugging configuration for VS Code [\#145](https://github.com/kubenav/kubenav/pull/145) ([ricoberger](https://github.com/ricoberger))
- Add support for Proxy [\#144](https://github.com/kubenav/kubenav/pull/144) ([ricoberger](https://github.com/ricoberger))
- Minor grammatical changes [\#139](https://github.com/kubenav/kubenav/pull/139) ([obrienrobert](https://github.com/obrienrobert))

## [2.2.0](https://github.com/kubenav/kubenav/tree/2.2.0) (2020-07-26)

[Full Changelog](https://github.com/kubenav/kubenav/compare/2.1.0...2.2.0)

**Implemented enhancements:**

- Feature\(ux\) Add empty cluster Page [\#131](https://github.com/kubenav/kubenav/issues/131)
- \[Bug/Feature request\] cannot copy text from terminals [\#120](https://github.com/kubenav/kubenav/issues/120)
- Add support for Pod Security Policies [\#130](https://github.com/kubenav/kubenav/pull/130) ([ricoberger](https://github.com/ricoberger))
- Support Component Statuses [\#127](https://github.com/kubenav/kubenav/pull/127) ([ricoberger](https://github.com/ricoberger))
- Add support for SSH connections to nodes [\#126](https://github.com/kubenav/kubenav/pull/126) ([ricoberger](https://github.com/ricoberger))
- Support terminal selection on mobile and add new shortcut to copy text [\#124](https://github.com/kubenav/kubenav/pull/124) ([ricoberger](https://github.com/ricoberger))

**Fixed bugs:**

- Issue with DigitalOcean Kubernetes [\#132](https://github.com/kubenav/kubenav/issues/132)
- Pod Status is green even the pod was evicted [\#128](https://github.com/kubenav/kubenav/issues/128)
- Current Version 2.1.0 crashes on up to date ArchLinux [\#123](https://github.com/kubenav/kubenav/issues/123)
- Fix scrolling in terminal [\#138](https://github.com/kubenav/kubenav/pull/138) ([ricoberger](https://github.com/ricoberger))
- Fix panic for invalid Kubeconfig [\#125](https://github.com/kubenav/kubenav/pull/125) ([ricoberger](https://github.com/ricoberger))

**Merged pull requests:**

- Improve error handling for requests [\#137](https://github.com/kubenav/kubenav/pull/137) ([ricoberger](https://github.com/ricoberger))
- Add description to cluster page [\#134](https://github.com/kubenav/kubenav/pull/134) ([ricoberger](https://github.com/ricoberger))
- Fix path on macOS [\#133](https://github.com/kubenav/kubenav/pull/133) ([ricoberger](https://github.com/ricoberger))
- Fix pod status [\#129](https://github.com/kubenav/kubenav/pull/129) ([ricoberger](https://github.com/ricoberger))

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
