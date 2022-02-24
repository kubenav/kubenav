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
