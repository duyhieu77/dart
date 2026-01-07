class Student {
  String id;
  String name;
  String email;
  int age;
  bool expelled;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    this.expelled = false,
  });
}
