import 'errors.dart';
import 'equality_comparer.dart';

class ComparableSet<TValue> {
  List<int> buckets;
  List<_Slot> slots;
  int count;
  int freeList;
  EqualityComparer<TValue> comparer;

  ComparableSet([this.comparer]) {
    buckets = List<int>.filled(7, 0, growable: false);
    slots = List<_Slot>.generate(7, (_) => _Slot(), growable: false);
    count = 0;
    freeList = -1;
  }

  int _internalGetHash(TValue value) {
    return (value == null) ? 0 : comparer.hash(value);
  }

  bool add(TValue value) => !find(value, true);
  bool contains(TValue value) => find(value, false);

  void addAll(Iterable<TValue> other) {
    for (final value in other) {
      add(value);
    }
  }

  bool remove(TValue value) {
    int hash = _internalGetHash(value);
    int bucket = hash % buckets.length;
    int last = -1;
    for (int i = buckets[bucket] - 1; i >= 0; last = i, i = slots[i].next) {
      if (slots[i].hashCode == hash &&
          comparer.compare(slots[i].value, value)) {
        if (last < 0) {
          buckets[bucket] = slots[i].next + 1;
        } else {
          slots[last].next = slots[i].next;
        }
        slots[i].hashCode = -1;
        slots[i].value = null;
        slots[i].next = freeList;
        freeList = i;
        return true;
      }
    }
    return false;
  }

  bool find(TValue value, bool shouldAdd) {
    int hash = _internalGetHash(value);
    for (int i = buckets[hash % buckets.length] - 1;
        i >= 0;
        i = slots[i].next) {
      if (slots[i].hashCode == hash &&
          comparer.compare(slots[i].value, value)) {
        return true;
      }
    }

    if (shouldAdd) {
      int index;
      if (freeList >= 0) {
        index = freeList;
        freeList = slots[index].next;
      } else {
        if (count == slots.length) resizeBuffer();
        index = count;
        count++;
      }
      int bucket = hash % buckets.length;
      slots[index].hashCode = hash;
      slots[index].value = value;
      slots[index].next = buckets[bucket] - 1;
      buckets[bucket] = index + 1;
    }

    return false;
  }

  void resizeBuffer() {
    int newSize = count * 2 + 1;
    if (newSize < count) throw IntegerOverflowError();

    final newBuckets = List<int>.filled(newSize, 0, growable: false);
    final newSlots =
        List<_Slot>.generate(newSize, (_) => _Slot(), growable: false);
    newSlots.setRange(0, slots.length, slots);

    for (int i = 0; i < count; i++) {
      int bucket = newSlots[i].hashCode % newSize;
      newSlots[i].next = newBuckets[bucket] - 1;
      newBuckets[bucket] = i + 1;
    }

    buckets = newBuckets;
    slots = newSlots;
  }

  @override
  String toString() {
    String output = '{';
    for (int i = 0; i < count; i++) {
      output +=
          '${output.length > 1 ? ", " : ""}${slots[i].value} (0x${slots[i].hashCode.toRadixString(16)})';
    }
    return '$output}';
  }
}

class _Slot<TValue> {
  TValue value;
  int next = 0;

  int _hash = 0;

  @override
  int get hashCode => _hash;
  set hashCode(int value) => _hash = value;

  @override
  String toString() => 'Slot {value: $value, hash: $_hash, next: $next}';
}
