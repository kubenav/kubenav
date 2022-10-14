import 'package:kubenav/models/resource_model.dart';

/// [BookmarkType] is a `enum`, which defines if a bookmark is related to the details or list view for the resources.
enum BookmarkType {
  details,
  list,
}

/// [bookmarkTypeFromString] converts a string into a [BookmarkType]. If the string doesn't match `details` or `list` we
/// return `null`.
BookmarkType? bookmarkTypeFromString(String? type) {
  if (type == null) {
    return null;
  }

  if (type.toLowerCase() == 'details') {
    return BookmarkType.details;
  }

  if (type.toLowerCase() == 'list') {
    return BookmarkType.list;
  }

  return null;
}

/// A [Bookmark] represents a single bookmark. Bookmarks can be used to proivde easier access to the users most used
/// resources. Bookmarks must have a [cluster], [type], [title], [resource], [scope] and an optionsl [name] and [namespace].
class Bookmark {
  String cluster;
  BookmarkType type;
  String title;
  String resource;
  String path;
  ResourceScope scope;
  String? name;
  String namespace;

  Bookmark({
    required this.cluster,
    required this.type,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.name,
    required this.namespace,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        cluster: json['cluster'] ?? '',
        type: bookmarkTypeFromString(json['type']) ?? BookmarkType.list,
        title: json['title'] ?? '',
        resource: json['resource'] ?? '',
        path: json['path'] ?? '',
        scope:
            resourceScopeFromString(json['scope']) ?? ResourceScope.namespaced,
        name: json['name'] ?? '',
        namespace: json['namespace'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'cluster': cluster,
        'type': type.name,
        'title': title,
        'resource': resource,
        'path': path,
        'scope': scope.name,
        'name': name,
        'namespace': namespace,
      };
}
