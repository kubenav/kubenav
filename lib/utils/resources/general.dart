import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApimachineryPkgApisMetaV1LabelSelector;

// Returns the age of a Kubernetes resources in a human readable format. This is mostly used to dertermine the age of
// a resource via the 'metadata.creationTimestamp' field. If the given timestamp is null we return a dash as
// placceholder for the age.
String getAge(DateTime? timestamp) {
  if (timestamp == null) {
    return '-';
  }

  return timeDiff(timestamp, DateTime.now());
}

String timeDiff(DateTime? start, DateTime? end) {
  if (start == null || end == null) {
    return '-';
  }

  final age = end.difference(start);

  if (age.inDays > 3) {
    return '${age.inDays}d';
  }

  if (age.inHours > 3) {
    return '${age.inHours}h';
  }

  if (age.inMinutes > 3) {
    return '${age.inMinutes}m';
  }

  return '${age.inSeconds}s';
}

// getSelector returns a selector string which can be used in a Kubernetes API request to the the all resources, which
// are matching the given selector. For example this can be used to get all Pods for a Deployment by using the
// 'deployment.spec.selector' field.
// TODO: Currently we only have implemented this function for the 'matchLabels' field in the selector. in the future we
// should also implement it for 'matchExpressions'.
String getSelector(IoK8sApimachineryPkgApisMetaV1LabelSelector? selector) {
  if (selector == null) {
    return '';
  }

  if (selector.matchLabels.isNotEmpty) {
    List<String> labelSelectors = [];
    selector.matchLabels
        .forEach((key, value) => labelSelectors.add('$key=$value'));

    return 'labelSelector=${labelSelectors.join(',')}';
  }

  return '';
}
