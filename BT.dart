import 'dart:convert';
import 'dart:io';

class Student {
  String name;
  double tuitionFee;
  List<double> otherFees;
  double scholarship;

  Student({
    required this.name,
    required this.tuitionFee,
    required this.otherFees,
    required this.scholarship,
  }) {
    if (!_isValid()) {
      throw Exception('Invalid Input');
    }
  }

  bool _isValid() {
    if (scholarship < 0) return false;
    if (otherFees.any((fee) => fee > tuitionFee)) return false;
    return true;
  }

  double get netTuition {
    final otherFeesSum = otherFees.fold(0.0, (a, b) => a + b);
    return tuitionFee - scholarship + otherFeesSum;
  }

  double get educationTax {
    if (netTuition > 15000) {
      return netTuition * 0.10;
    } else if (netTuition >= 7000) {
      return netTuition * 0.05;
    } else {
      return netTuition * 0.02;
    }
  }


  double projectedAnnualCost(double monthlyLivingExpenses) {
    return netTuition + (monthlyLivingExpenses * 12) + educationTax;
  }


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'tuitionFee': tuitionFee,
      'otherFees': otherFees,
      'scholarship': scholarship,
    };
  }

 
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      tuitionFee: map['tuitionFee'],
      otherFees: List<double>.from(map['otherFees']),
      scholarship: map['scholarship'],
    );
  }
}
