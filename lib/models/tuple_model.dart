/// A [Tuple] can be used two return two values from a function. For example the first item can be the actual value
/// which should be returned by a function and the second item can be an error message if the generation of the value
/// for the first item fails.
class Tuple<T1, T2> {
  final T1 item1;
  final T2 item2;

  Tuple({
    required this.item1,
    required this.item2,
  });
}
