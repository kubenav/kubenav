import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/storage.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_customresourcedefinitions.dart';

class BookmarksRepository with ChangeNotifier {
  List<Bookmark> _bookmarks = [];

  List<Bookmark> get bookmarks => _bookmarks;

  Future<void> _save() async {
    try {
      await Storage().write(
        'kubenav-bookmarks-v5',
        json.encode(_bookmarks.map((e) => e.toJson()).toList()),
      );
    } catch (err) {
      Logger.log('BookmarksRepository _save', 'Failed to Save Bookmarks', err);
    }
  }

  Future<void> init() async {
    try {
      final data = await Storage().read('kubenav-bookmarks-v5');
      if (data != null) {
        _bookmarks = List<Bookmark>.from(
          json.decode(data).map((e) => Bookmark.fromJson(e)),
        );
      }
      notifyListeners();
    } catch (err) {
      Logger.log('BookmarksRepository _init', 'Failed to Load Bookmarks', err);
    }
  }

  Future<void> addBookmark(
    BookmarkType type,
    String clusterId,
    String? name,
    String? namespace,
    Resource resource,
  ) async {
    _bookmarks.add(
      Bookmark(
        type: type,
        clusterId: clusterId,
        name: name,
        namespace: namespace,
        resource: resource,
      ),
    );
    await _save();
    notifyListeners();
  }

  Future<void> removeBookmark(int index) async {
    _bookmarks.removeAt(index);
    await _save();
    notifyListeners();
  }

  Future<void> removeBookmarksForCluster(String clusterId) async {
    _bookmarks = _bookmarks.where((e) => e.clusterId != clusterId).toList();

    await _save();
    notifyListeners();
  }

  /// [isBookmarked] returns the index of the bookmark which matches the given
  /// arguments or `-1` if no bookmark matches the given arguments.
  int isBookmarked(
    BookmarkType type,
    String clusterId,
    String? name,
    String? namespace,
    Resource resource,
  ) {
    for (var i = 0; i < _bookmarks.length; i++) {
      if (_bookmarks[i].type == type &&
          _bookmarks[i].clusterId == clusterId &&
          _bookmarks[i].name == name &&
          _bookmarks[i].namespace == namespace &&
          _resourcesEqual(_bookmarks[i].resource.id(), resource.id())) {
        return i;
      }
    }

    return -1;
  }

  /// [reorder] can be used to change the order of the [_bookmarks]
  /// (e.g. via ReorderableListView). The order of the bookmarks, matters,
  /// because in some parts of the ui we are only displaying the top X bookmarks
  /// instead of all bookmarks.
  ///
  /// We have to check if the user drags a bookmark from top to bottom ([start]
  /// is lower then [current]) or from the bottom to the top ([start] is greater
  /// then [current]), to apply a different logic for the reordering.
  Future<void> reorder(int start, int current) async {
    if (start < current) {
      int end = current - 1;
      Bookmark startItem = _bookmarks[start];
      int i = 0;
      int local = start;
      do {
        _bookmarks[local] = _bookmarks[++local];
        i++;
      } while (i < end - start);
      _bookmarks[end] = startItem;
    } else if (start > current) {
      Bookmark startItem = _bookmarks[start];
      for (int i = start; i > current; i--) {
        _bookmarks[i] = _bookmarks[i - 1];
      }
      _bookmarks[current] = startItem;
    }

    await _save();
    notifyListeners();
  }
}

/// [BookmarkType] is a `enum`, which defines if a bookmark is related to the
/// [details] or [list] view for the resources.
enum BookmarkType { details, list }

extension BookmarkTypeExtension on BookmarkType {
  /// [toShortString] returns a short string of the bookmark type, so that we
  /// can use the type within the json encode and decode functions.
  String toShortString() {
    return toString().split('.').last;
  }
}

/// [getBookmarkTypeFromString] converts a string into a [BookmarkType]. If the
/// string is `details` it will return [BookmarkType.details] for all other
/// cases it will return [BookmarkType.list].
BookmarkType getBookmarkTypeFromString(String? type) {
  if (type?.toLowerCase() == 'details') {
    return BookmarkType.details;
  }

  return BookmarkType.list;
}

/// A [Bookmark] represents a single bookmark. Bookmarks can be used to proivde
/// easier access to the users most used resources. Bookmarks must have a
/// [type], [cluster], [name], [namespace] and [resource] so that we can
/// identify the resource which was bookmarked.
class Bookmark {
  BookmarkType type;
  String clusterId;
  String? name;
  String? namespace;
  Resource resource;

  Bookmark({
    required this.type,
    required this.clusterId,
    required this.name,
    required this.namespace,
    required this.resource,
  });

  factory Bookmark.fromJson(Map<String, dynamic> data) {
    final resource = [
      ...resources,
      ...fluxResources,
      ...certManagerResources,
    ].where((e) => _resourcesEqual(e.id(), data['resource'])).toList();

    if (resource.isEmpty) {
      return Bookmark(
        type: getBookmarkTypeFromString(data['type']),
        clusterId: data['clusterId'],
        name: data.containsKey('name') && data['name'] != null
            ? data['name']
            : null,
        namespace: data.containsKey('namespace') && data['namespace'] != null
            ? data['namespace']
            : null,
        resource: buildCustomResource(
          data['resource']['plural'],
          data['resource']['singular'],
          data['resource']['description'],
          data['resource']['path'],
          data['resource']['resource'],
          data['resource']['scope'],
          List<AdditionalPrinterColumns>.from(
            data['resource']['additionalPrinterColumns'].map(
              (e) => AdditionalPrinterColumns.fromJson(e),
            ),
          ),
        ),
      );
    } else {
      return Bookmark(
        type: getBookmarkTypeFromString(data['type']),
        clusterId: data['clusterId'],
        name: data.containsKey('name') && data['name'] != null
            ? data['name']
            : null,
        namespace: data.containsKey('namespace') && data['namespace'] != null
            ? data['namespace']
            : null,
        resource: resource[0],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toShortString(),
      'clusterId': clusterId,
      'name': name,
      'namespace': namespace,
      'resource': resource.id(),
    };
  }
}

bool _resourcesEqual(Map<String, dynamic> a, Map<String, dynamic> b) {
  return a['plural'] == b['plural'] &&
      a['singular'] == b['singular'] &&
      a['description'] == b['description'] &&
      a['path'] == b['path'] &&
      a['resource'] == b['resource'] &&
      a['scope'] == b['scope'];
}
