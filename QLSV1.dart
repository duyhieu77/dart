import 'dart:io';

class SinhVien {
  String maSV;
  String tenSV;
  int tuoi;

  SinhVien(this.maSV, this.tenSV, this.tuoi);

  void printsv() {
    print("Mã SV: $maSV | Tên SV: $tenSV | Tuổi: $tuoi");
  }
}

void main() {
  List<SinhVien> danhSachSV = [];

  while (true) {
    print("\n===== MENU QUẢN LÝ SINH VIÊN =====");
    print("1. Thêm sinh viên");
    print("2. Hiển thị danh sách sinh viên");
    print("3. Tìm sinh viên theo mã");
    print("0. Thoát");
    stdout.write("Chọn chức năng: ");

    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 0) {
      print("Thoát");
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

        danhSachSV.add(SinhVien(ma, ten, tuoi));
        print("Thêm thành công");
        break;

      case 2:
        if (danhSachSV.isEmpty) {
          print("Không có sinh viên");
        } else {
          print("\n Danh sách sinh viên:");
          for (var sv in danhSachSV) {
            sv.printsv();
          }
        }
        break;

      case 3:
        stdout.write("Nhập mã sinh viên: ");
        String maTim = stdin.readLineSync()!;

        bool found = false;
        for (var sv in danhSachSV) {
          if (sv.maSV == maTim) {
            print("Sinh viên:");
            sv.printsv();
            found = true;
            break;
          }
        }

        if (!found) {
          print(" Không tìm thấy sinh viên $maTim");
        }
        break;

      default:
        print("Lựa chọn không đúng");
    }
  }
}
