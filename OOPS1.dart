import 'dart:io';

class Employee {
  String name;
  double baseSalary;
  int workingDays;

  Employee(this.name, this.baseSalary, this.workingDays);

  double calculateSalary() {
    return baseSalary * workingDays;
  }

  void addWorkingDays(int days) {
    if (days > 0) {
      workingDays += days;
    } else {
      print('Invalid number of days');
    }
  }

  @override
  String toString() {
    return 'Employee{name: $name, baseSalary: $baseSalary, '
        'workingDays: $workingDays, totalSalary: ${calculateSalary()}}';
  }
}

void main() {
  List<Employee> employees = [];

  stdout.write('Nhập số lượng nhân viên: ');
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print('\nNhân viên thứ ${i + 1}');

    stdout.write('Tên: ');
    String name = stdin.readLineSync()!;

    stdout.write('Lương cơ bản: ');
    double baseSalary = double.parse(stdin.readLineSync()!);

    stdout.write('Số ngày làm việc: ');
    int workingDays = int.parse(stdin.readLineSync()!);

    employees.add(Employee(name, baseSalary, workingDays));
  }

  employees.sort(
    (a, b) => b.calculateSalary().compareTo(a.calculateSalary()),
  );

  print('\nDanh sách nhân viên theo lương giảm dần:');
  for (var emp in employees) {
    print(emp);
  }
}
