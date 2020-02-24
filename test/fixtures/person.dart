class Person {
  Person(this.name);

  final String name;

  @override
  bool operator ==(dynamic other) {
    if (other is Person) {
      return name == other.name;
    }
    return false;
  }

  @override
  String toString() => '{name: $name}';
}
