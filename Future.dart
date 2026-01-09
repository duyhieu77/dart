class Student {
  int id;
  String fname;
  String lname;
  String birthday;
  String phone;
  String email;

  Student({
    required this.id,
    required this.fname,
    required this.lname,
    required this.birthday,
    required this.phone,
    required this.email,
  });
}

Future<Student> getInformation(int id) {
  return Future<Student>(() {
    return Future.delayed(Duration(seconds: 2), () {
      List<Student> students = [
        Student(
          id: 1,
          fname: "John",
          lname: "Doe",
          birthday: "1995-05-15",
          phone: "123456789",
          email: "john.doe@example.com",
        ),
        Student(
          id: 2,
          fname: "Jane",
          lname: "Smith",
          birthday: "1997-10-20",
          phone: "987654321",
          email: "jane.smith@example.com",
        ),
        Student(
          id: 3,
          fname: "Alice",
          lname: "Johnson",
          birthday: "1996-02-25",
          phone: "456789123",
          email: "alice.johnson@example.com",
        ),
        Student(
          id: 4,
          fname: "Bob",
          lname: "Williams",
          birthday: "1998-11-30",
          phone: "321654987",
          email: "bob.williams@example.com",
        ),
        Student(
          id: 5,
          fname: "Charlie",
          lname: "Brown",
          birthday: "1994-04-14",
          phone: "654321789",
          email: "charlie.brown@example.com",
        ),
      ];

      if (id > 0 && id <= students.length) {
        return students[id - 1];
      } else {
        throw Exception("Student not found");
      }
    });
  });
}

void main() {
  for (int i = 1; i <= 5; i++) {
    getInformation(i).then((student) {
      print("ID: ${student.id}");
      print("First Name: ${student.fname}");
      print("Last Name: ${student.lname}");
      print("Birthday: ${student.birthday}");
      print("Phone: ${student.phone}");
      print("Email: ${student.email}");
      print("----------");
    }).catchError((error) {
      print(error);
    });
  }
}