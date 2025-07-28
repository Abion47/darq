class Pet {
  Pet(this.name, this.age);

  final String name;
  final double age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is Pet) {
      return name == other.name && age == other.age;
    }
    return false;
  }

  @override
  String toString() => '{name: $name, age: $age}';
}
