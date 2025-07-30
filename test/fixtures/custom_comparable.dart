class CustomComparable implements Comparable<CustomComparable> {
  final int value;

  const CustomComparable(this.value);

  @override
  int compareTo(CustomComparable other) {
    return value.compareTo(other.value);
  }
}
