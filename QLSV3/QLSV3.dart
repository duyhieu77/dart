import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

abstract class PersonInfo {
  void showBasicInfo();
}

abstract class Person {
  void showFullInfo();
}

class SinhVien extends Person implements PersonInfo {
  String maSV;
  String tenSV;
  int tuoi;

  SinhVien(this.maSV, this.tenSV, this.tuoi);

  @override
  void showBasicInfo() {
    print("Mã SV: $maSV | Tên SV: $tenSV");
  }

  @override
  void showFullInfo() {
    print("Mã SV: $maSV | Tên SV: $tenSV | Tuổi: $tuoi");
  }
}

void main() {
  final db = sqlite3.open('sinhvien.db');

  db.execute('''
    CREATE TABLE IF NOT EXISTS sinhvien (
      maSV TEXT PRIMARY KEY,
      tenSV TEXT,
      tuoi INTEGER
    )
  ''');

  while (true) {
    print("\n===== MENU QUẢN LÝ SINH VIÊN =====");
    print("1. Thêm sinh viên");
    print("2. Hiển thị danh sách sinh viên");
    print("3. Tìm sinh viên theo mã");
    print("0. Thoát");
    stdout.write("Chọn chức năng: ");

    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 0) {
      print("Thoát chương trình");
      db.dispose();
      break;
    }

    switch (choice) {
      case 1:
        stdout.write("Nhập mã sinh viên: ");
        String ma = stdin.readLineSync()!;

        stdout.write("Nhập tên sinh viên: ");
        String ten = stdin.readLineSync()!;

        stdout.write("Nhập tuổi: ");
        int tuoi = int.parse(stdin.readLineSync()!);

        db.execute(
          'INSERT OR REPLACE INTO sinhvien VALUES (?, ?, ?)',
          [ma, ten, tuoi],
        );

        print("Thêm sinh viên thành công");
        break;
      case 2:
        final result = db.select('SELECT * FROM sinhvien');

        if (result.isEmpty) {
          print("Không có sinh viên");
        } else {
          print("\nDanh sách sinh viên:");
          for (final row in result) {
            SinhVien sv = SinhVien(
              row['maSV'],
              row['tenSV'],
              row['tuoi'],
            );
            sv.showFullInfo();
          }
        }
        break;
      case 3:
        stdout.write("Nhập mã sinh viên cần tìm: ");
        String maTim = stdin.readLineSync()!;

        final result = db.select(
          'SELECT * FROM sinhvien WHERE maSV = ?',
          [maTim],
        );

        if (result.isEmpty) {
          print("Không tìm thấy sinh viên $maTim");
        } else {
          print("Thông tin sinh viên:");
          final row = result.first;
          SinhVien sv = SinhVien(
            row['maSV'],
            row['tenSV'],
            row['tuoi'],
          );
          sv.showFullInfo();
        }
        break;

      default:
        print("Lựa chọn không đúng");
    }
  }
}
