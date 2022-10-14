import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:kubenav/models/bookmark_model.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';

/// The [BookmarkController] is responsible for handling the bookmarks of a user. It holds a list of all existing
/// [bookmarks] and allows users to add new ones or remove existing ones. It is also responsible for saving the list of
/// bookmarks to the storage every time the list changes.
class BookmarkController extends GetxController {
  RxList<Bookmark> bookmarks = <Bookmark>[].obs;

  /// [onInit] is used to initialize the bookmarks. For that we are looking if the value is already saved in the
  /// storage. If this is the case we are reusing the saved value. If we could not found saved bookmarks we are using
  /// the default values (empty list).
  ///
  /// Besides that we are also using the [ever] function so that all changes to the list of bookmarks are saved back to
  /// the storage.
  @override
  void onInit() {
    List? storedBookmarks = GetStorage().read<List>('bookmarks');

    if (storedBookmarks != null && storedBookmarks.isNotEmpty) {
      bookmarks = storedBookmarks.map((e) => Bookmark.fromJson(e)).toList().obs;
    }

    ever(bookmarks, (_) {
      GetStorage().write('bookmarks', bookmarks.toList());
    });

    super.onInit();
  }

  void addBookmark(
    String? cluster,
    BookmarkType? type,
    String? title,
    String? resource,
    String? path,
    ResourceScope? scope,
    String? name,
    String? namespace,
  ) {
    if (cluster == null ||
        type == null ||
        title == null ||
        resource == null ||
        path == null ||
        scope == null ||
        namespace == null) {
      Logger.log(
        'BookmarkController addBookmark',
        'A required parameter is missing',
        'Cluster: $cluster, Type: $type, Title: $title, Resource: $resource, Path: $path, Scope: $scope, Name: $name, Namespace: $namespace',
      );
      snackbar('Could not add bookmark', 'A required parameter is missing');
    } else {
      Logger.log(
        'BookmarkController addBookmark',
        'Bookmark was added',
        'Cluster: $cluster, Type: $type, Title: $title, Resource: $resource, Path: $path, Scope: $scope, Name: $name, Namespace: $namespace',
      );

      bookmarks.add(
        Bookmark(
          cluster: cluster,
          type: type,
          title: title,
          resource: resource,
          path: path,
          scope: scope,
          name: name,
          namespace: namespace,
        ),
      );

      snackbar(
        'Bookmark was added',
        'Resource: $title\nCluster: $cluster\nNamespace: $namespace${name != null ? '\nName: $name' : ''}',
      );
    }
  }

  void removeBookmark(int index) {
    final tmpBookmark = bookmarks[index];
    bookmarks.removeAt(index);
    snackbar(
      'Bookmark was removed',
      'Resource: ${tmpBookmark.title}\nCluster: ${tmpBookmark.cluster}\nNamespace: ${tmpBookmark.namespace}${tmpBookmark.name != null ? '\nName: ${tmpBookmark.name}' : ''}',
    );
  }

  /// [isBookmarked] returns the index of the bookmark which matches the given arguments or `-1` if no bookmark matches
  /// the given arguments.
  int isBookmarked(
    String? cluster,
    BookmarkType? type,
    String? title,
    String? resource,
    String? path,
    ResourceScope? scope,
    String? name,
    String? namespace,
  ) {
    for (var i = 0; i < bookmarks.length; i++) {
      if (bookmarks[i].cluster == cluster &&
          bookmarks[i].type == type &&
          bookmarks[i].title == title &&
          bookmarks[i].resource == resource &&
          bookmarks[i].path == path &&
          bookmarks[i].scope == scope &&
          bookmarks[i].name == name &&
          bookmarks[i].namespace == namespace) {
        return i;
      }
    }

    return -1;
  }

  /// [reorder] can be used to change the order of the bookmarks (e.g. via ReorderableListView). The order of the
  /// bookmarks, matters, because in some parts of the ui we are only displaying the top X bookmarks instead of all
  /// bookmarks.
  ///
  /// We have to check if the user drags a bookmark from top to bottom ([start] is lower then [current]) or from the
  /// bottom to the top ([start] is greater then [current]), to apply a different logic for the reordering.
  void reorder(int start, int current) {
    if (start < current) {
      int end = current - 1;
      Bookmark startItem = bookmarks[start];
      int i = 0;
      int local = start;
      do {
        bookmarks[local] = bookmarks[++local];
        i++;
      } while (i < end - start);
      bookmarks[end] = startItem;
    } else if (start > current) {
      Bookmark startItem = bookmarks[start];
      for (int i = start; i > current; i--) {
        bookmarks[i] = bookmarks[i - 1];
      }
      bookmarks[current] = startItem;
    }
  }
}
