import '../entities/student.dart';

abstract class StudentRepository {
  void add(Student student);
  List<Student> getAll();
  Student? findByEmail(String email);
  List<Student> searchByName(String name);
  List<Student> expelledStudents();
  void registerSubject(String studentId, String subjectName);
}
