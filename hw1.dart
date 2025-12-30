import 'dart:io';

void main(){
  while(true){
    print("1 +");
    print("2 -");
    print("3 *");
    print("4 /");
    print("5 Exit");

    stdout.write("Choice 1-5: ");
    int choice = int.parse(stdin.readLineSync()!);

    if(choice < 1|| choice > 4){
      print("Wrong");
      continue;
    } 

    if (choice == 5) {
      print("Exit program");
      break;
    }

    stdout.write("Enter first number: ");
    double a = double.parse(stdin.readLineSync()!);

    stdout.write("Enter second number: ");
    double b = double.parse(stdin.readLineSync()!);

    double result;

    switch (choice) {
      case 1:
        result = a + b;
        print("Result: $a + $b = $result");
        break;

      case 2:
        result = a - b;
        print("Result: $a - $b = $result");
        break;

      case 3:
        result = a * b;
        print("Result: $a * $b = $result");
        break;

      case 4:
        if (b == 0) {
          print("Error: Cannot divide by zero!");
        } else {
          result = a / b;
          print("Result: $a / $b = $result");
        }
        break;
    }
  }
}
