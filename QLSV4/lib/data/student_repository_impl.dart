import '../domain/entities/student.dart';
import '../domain/repositories/student_repository.dart';
import 'database.dart';

class StudentRepositoryImpl implements StudentRepository {
  final AppDatabase database;

  StudentRepositoryImpl(this.database);

  @override
  void add(Student s) {
    database.db.execute(
      'INSERT INTO students VALUES (?, ?, ?, ?, ?)',
      [s.id, s.name, s.email, s.age, s.expelled ? 1 : 0],
    );
  }

  @override
  List<Student> getAll() {
    final rs = database.db.select('SELECT * FROM students');
    return rs.map((r) => Student(
      id: r['id'],
      name: r['name'],
      email: r['email'],
      age: r['age'],
      expelled: r['expelled'] == 1,
    )).toList();
  }

  @override
  Student? findByEmail(String email) {
    final rs = database.db.select(
      'SELECT * FROM students WHERE email = ?', [email]
    );
    if (rs.isEmpty) return null;
    final r = rs.first;
    return Student(
      id: r['id'],
      name: r['name'],
      email: r['email'],
      age: r['age'],
      expelled: r['expelled'] == 1,
    );
  }

  @override
  List<Student> searchByName(String name) {
    final rs = database.db.select(
      'SELECT * FROM students WHERE name LIKE ?', ['%$name%']
    );
    return rs.map((r) => Student(
      id: r['id'],
      name: r['name'],
      email: r['email'],
      age: r['age'],
      expelled: r['expelled'] == 1,
    )).toList();
  }

  @override
  List<Student> expelledStudents() {
    final rs = database.db.select(
      'SELECT * FROM students WHERE expelled = 1'
    );
    return rs.map((r) => Student(
      id: r['id'],
      name: r['name'],
      email: r['email'],
      age: r['age'],
      expelled: true,
    )).toList();
  }

  @override
  void registerSubject(String studentId, String subjectName) {
    database.db.execute(
      'INSERT INTO subjects (student_id, name) VALUES (?, ?)',
      [studentId, subjectName],
    );
  }
}
