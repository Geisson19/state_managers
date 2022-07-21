class User {
  String name;
  int age;
  List<String> careers;

  User({required this.name, required this.age, required this.careers});

  User copyWith({String? name, int? age, List<String>? careers}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      careers: careers ?? this.careers,
    );
  }

  @override
  String toString() {
    return 'User { name: $name, age: $age, careers: $careers }';
  }
}
