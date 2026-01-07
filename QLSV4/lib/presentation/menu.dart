import 'dart:io';
import '../usecases/student_usecase.dart';
import '../domain/entities/student.dart';

void showMenu(StudentUseCase usecase) {
  while (true) {
    print("""
===== MENU =====
1. Thêm sinh viên
2. Hiển thị danh sách
3. Tìm theo email / tên
4. Xem sinh viên bị đuổi học
5. Đăng ký môn học
0. Thoát
""");

    int c = int.parse(stdin.readLineSync()!);

    if (c == 0) break;

    switch (c) {
      case 1:
        try {
          stdout.write("ID: "); var id = stdin.readLineSync()!;
          stdout.write("Tên: "); var name = stdin.readLineSync()!;
          stdout.write("Email: "); var email = stdin.readLineSync()!;
          stdout.write("Tuổi: "); var age = int.parse(stdin.readLineSync()!);

          usecase.addStudent(
            Student(id: id, name: name, email: email, age: age),
          );
          print("Thêm thành công");
        } catch (e) {
          print("Không thành công $e");
        }
        break;

      case 2:
        usecase.getAll().forEach(
          (s) => print("${s.name} | ${s.email} | ${s.age}")
        );
        break;

      case 3:
        stdout.write("Nhập từ khóa: ");
        var k = stdin.readLineSync()!;
        usecase.search(k).forEach(
          (s) => print("${s.name} - ${s.email}")
        );
        break;

      case 4:
        usecase.expelledStudents().forEach(
          (s) => print(s.name)
        );
        break;

      case 5:
        stdout.write("Mã SV: ");
        var id = stdin.readLineSync()!;
        stdout.write("Tên môn học: ");
        var sub = stdin.readLineSync()!;
        usecase.registerSubject(id, sub);
        print("Đã đăng ký");
        break;
    }
  }
}
