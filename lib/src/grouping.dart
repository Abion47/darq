abstract class IGrouping<TKey, TValue> {
  TKey get key;
}

class Grouping<TKey, TValue> extends Iterable<TValue>
    implements IGrouping<TKey, TValue> {
  List<TValue> elements;
  Grouping hashNext;
  Grouping next;
  TKey key;
  int hash;

  int get count => elements.length;

  @override
  Iterator<TValue> get iterator => elements.iterator;

  void add(TValue value) {
    elements.add(value);
  }

  bool containsValue(TValue value) => elements.contains(value);
  int indexOf(TValue value) => elements.indexOf(value);

  TValue operator [](int index) => elements[index];

  @override
  int get hashCode => hash;
}
