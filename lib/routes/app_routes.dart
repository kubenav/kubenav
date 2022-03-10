/// [Routes] represents all routes for our pages in the app. Each route must be starts with `/home`, `/resources`,
/// `/plugins` or `/settings`, so that we can highlight the correct navigation in the bottom navigation menu.
class Routes {
  static const home = '/home';
  static const resources = '/resources/';
  static const resourcesBookmarks = '/resources/bookmarks';
  static const resourcesDetails = '/resources/details';
  static const resourcesList = '/resources/list';
  static const resourcesListCRDs = '/resources/list/crds';
  static const plugins = '/plugins';
  static const settings = '/settings/';
  static const settingsClusters = '/settings/clusters';
}
