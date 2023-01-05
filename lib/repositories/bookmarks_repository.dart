import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/storage.dart';

class BookmarksRepository with ChangeNotifier {
  List<Bookmark> _bookmarks = [];

  List<Bookmark> get bookmarks => _bookmarks;

  Future<void> _save() async {
    try {
      await Storage().write(
        'kubenav-bookmarks',
        json.encode(_bookmarks.map((e) => e.toJson()).toList()),
      );
    } catch (err) {
      Logger.log(
        'BookmarksRepository _save',
        'Could not save bookmarks',
        err,
      );
    }
  }

  Future<void> init() async {
    try {
      final data = await Storage().read('kubenav-bookmarks');
      if (data != null) {
        _bookmarks = List<Bookmark>.from(
            json.decode(data).map((e) => Bookmark.fromJson(e)));
      }
      notifyListeners();
    } catch (err) {
      Logger.log(
        'BookmarksRepository _init',
        'Could not load bookmarks',
        err,
      );
    }
  }

  Future<void> addBookmark(
    BookmarkType type,
    String clusterId,
    String title,
    String resource,
    String path,
    ResourceScope scope,
    List<AdditionalPrinterColumns> additionalPrinterColumns,
    String? name,
    String? namespace,
  ) async {
    _bookmarks.add(
      Bookmark(
        type: type,
        clusterId: clusterId,
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        name: name,
        namespace: namespace,
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

  /// [isBookmarked] returns the index of the bookmark which matches the given
  /// arguments or `-1` if no bookmark matches the given arguments.
  int isBookmarked(
    BookmarkType type,
    String clusterId,
    String title,
    String resource,
    String path,
    ResourceScope scope,
    String? name,
    String? namespace,
  ) {
    for (var i = 0; i < _bookmarks.length; i++) {
      if (_bookmarks[i].type == type &&
          _bookmarks[i].clusterId == clusterId &&
          _bookmarks[i].title == title &&
          _bookmarks[i].resource == resource &&
          _bookmarks[i].path == path &&
          _bookmarks[i].scope == scope &&
          _bookmarks[i].name == name &&
          _bookmarks[i].namespace == namespace) {
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
enum BookmarkType {
  details,
  list,
}

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
/// [cluster], [type], [title], [resource], [scope] and an optionsl [name] and
/// [namespace].
class Bookmark {
  BookmarkType type;
  String clusterId;
  String title;
  String resource;
  String path;
  ResourceScope scope;
  List<AdditionalPrinterColumns> additionalPrinterColumns;
  String? name;
  String? namespace;

  Bookmark({
    required this.type,
    required this.clusterId,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.name,
    required this.namespace,
  });

  factory Bookmark.fromJson(Map<String, dynamic> data) {
    return Bookmark(
      type: getBookmarkTypeFromString(data['type']),
      clusterId: data['clusterId'],
      title: data['title'],
      resource: data['resource'],
      path: data['path'],
      scope: getResourceScopeFromString(data['scope']),
      additionalPrinterColumns: data.containsKey('additionalPrinterColumns') &&
              data['additionalPrinterColumns'] != null
          ? List<AdditionalPrinterColumns>.from(data['additionalPrinterColumns']
              .map((v) => AdditionalPrinterColumns.fromJson(v)))
          : [],
      name: data.containsKey('name') && data['name'] != null
          ? data['name']
          : null,
      namespace: data.containsKey('namespace') && data['namespace'] != null
          ? data['namespace']
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toShortString(),
      'clusterId': clusterId,
      'title': title,
      'resource': resource,
      'path': path,
      'scope': scope.toShortString(),
      'additionalPrinterColumns':
          additionalPrinterColumns.map((e) => e.toJson()).toList(),
      'name': name,
      'namespace': namespace,
    };
  }
}
