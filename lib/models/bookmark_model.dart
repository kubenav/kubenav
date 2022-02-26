// Bookmark represents a single bookmark. Bookmarks can be used to proivde easier access to the users most used
// resources. Bookmarks must have a name, which can be customized by a user, as well as the active, namespace and route
// the bookmark is bounded to.
class Bookmark {
  String name;
  String cluster;
  String namespace;
  String route;

  Bookmark({
    required this.name,
    required this.cluster,
    required this.namespace,
    required this.route,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        name: json['name'],
        cluster: json['cluster'],
        namespace: json['namespace'],
        route: json['route'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'cluster': cluster,
        'namespace': namespace,
        'route': route,
      };
}
