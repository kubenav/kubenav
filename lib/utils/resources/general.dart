// Returns the age of a Kubernetes resources in a human readable format. This is mostly used to dertermine the age of
// a resource via the 'metadata.creationTimestamp' field. If the given timestamp is null we return a dash as
// placceholder for the age.
String getAge(DateTime? timestamp) {
  if (timestamp == null) {
    return '-';
  }

  final age = DateTime.now().difference(timestamp);

  if (age.inDays > 3) {
    return '${age.inDays}d';
  }

  if (age.inHours > 3) {
    return '${age.inHours}h';
  }

  return '${age.inMinutes}m';
}
