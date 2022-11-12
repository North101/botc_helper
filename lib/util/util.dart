class IndexedValue<E> {
  const IndexedValue(this.index, this.value);

  final int index;
  final E value;
}

extension IterableExtension<E> on Iterable<E> {
  Iterable<IndexedValue<E>> get withIndex sync* {
    var i = 0;
    for (final value in this) {
      yield IndexedValue(i++, value);
    }
  }
}
