import '../domain/entities/student.dart';
import '../domain/repositories/student_repository.dart';

class StudentUseCase {
  final StudentRepository repo;

  StudentUseCase(this.repo);

  void addStudent(Student student) {
    if (student.age <= 18) {
      throw Exception("Tuổi phải > 18");
    }
    if (repo.findByEmail(student.email) != null) {
      throw Exception("Email đã tồn tại");
    }
    repo.add(student);
  }

  List<Student> search(String keyword) {
    final byEmail = repo.findByEmail(keyword);
    if (byEmail != null) return [byEmail];
    return repo.searchByName(keyword);
  }

  List<Student> expelledStudents() {
    return repo.expelledStudents();
  }

  void registerSubject(String studentId, String subjectName) {
    repo.registerSubject(studentId, subjectName);
  }

  List<Student> getAll() => repo.getAll();
}
