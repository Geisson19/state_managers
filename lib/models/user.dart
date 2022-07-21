class User {
  String name;
  int age;
  List<String> carrers;

  User({required this.name, required this.age, required this.carrers});

  User copyWith({String? name, int? age, List<String>? carrers}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      carrers: carrers ?? this.carrers,
    );
  }
}
