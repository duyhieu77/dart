Future<double> add(double a, double b) async {
  await Future.delayed(Duration(seconds: 1));
  return a + b;
}

Future<double> subtract(double a, double b) async {
  await Future.delayed(Duration(seconds: 1));
  return a - b;
}

Future<double> multiply(double a, double b) async {
  await Future.delayed(Duration(seconds: 1));
  return a * b;
}

Future<double> divide(double a, double b) async {
  await Future.delayed(Duration(seconds: 1));
  if (b == 0) {
    throw Exception("Không thể chia cho 0");
  }
  return a / b;
}

Future<void> main() async {
  double a = 10;
  double b = 5;

  try {
    print("Cộng: ${await add(a, b)}");
    print("Trừ: ${await subtract(a, b)}");
    print("Nhân: ${await multiply(a, b)}");
    print("Chia: ${await divide(a, b)}");
  } catch (e) {
    print("Lỗi: $e");
  }
}
