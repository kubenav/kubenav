extension DateTimeExtension on DateTime {
  /// [toRFC3339Nano] formates the given [DateTime] to a RFC3339Nano string, which
  /// is used to set the `reconcile.fluxcd.io/requestedAt` annotation.
  String toRFC3339Nano() {
    final t = toUtc();

    String y = (t.year >= -9999 && t.year <= 9999)
        ? _fourDigits(t.year)
        : _sixDigits(t.year);
    String m = _twoDigits(t.month);
    String d = _twoDigits(t.day);
    String h = _twoDigits(t.hour);
    String min = _twoDigits(t.minute);
    String sec = _twoDigits(t.second);
    String ms = _threeDigits(t.millisecond);
    String us = t.microsecond == 0 ? '' : _threeDigits(t.microsecond);

    return '$y-$m-${d}T$h:$min:$sec.$ms$us+00:00';
  }

  /// [toRFC3339] formates the given [DateTime] to a RFC3339 string, which is
  /// used to set a time as used by Kubernetes.
  String toRFC3339() {
    final t = toUtc();

    String y = (t.year >= -9999 && t.year <= 9999)
        ? _fourDigits(t.year)
        : _sixDigits(t.year);
    String m = _twoDigits(t.month);
    String d = _twoDigits(t.day);
    String h = _twoDigits(t.hour);
    String min = _twoDigits(t.minute);
    String sec = _twoDigits(t.second);

    return '$y-$m-${d}T$h:$min:${sec}Z';
  }
}

String _fourDigits(int n) {
  int absN = n.abs();
  String sign = n < 0 ? '-' : '';
  if (absN >= 1000) return '$n';
  if (absN >= 100) return '${sign}0$absN';
  if (absN >= 10) return '${sign}00$absN';
  return '${sign}000$absN';
}

String _sixDigits(int n) {
  assert(n < -9999 || n > 9999);
  int absN = n.abs();
  String sign = n < 0 ? '-' : '+';
  if (absN >= 100000) return '$sign$absN';
  return '${sign}0$absN';
}

String _threeDigits(int n) {
  if (n >= 100) return '$n';
  if (n >= 10) return '0$n';
  return '00$n';
}

String _twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}
