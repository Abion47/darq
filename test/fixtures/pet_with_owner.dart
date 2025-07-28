import 'person.dart';

class Pet {
  Pet(this.name, this.age, this.owner);

  final String name;
  final double age;
  final Person owner;

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ owner.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is Pet) {
      return name == other.name && age == other.age && owner == other.owner;
    }
    return false;
  }

  @override
  String toString() => '{name: $name, age: $age, owner: $owner}';
}
