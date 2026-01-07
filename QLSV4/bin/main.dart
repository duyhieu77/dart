import '../lib/data/database.dart';
import '../lib/data/student_repository_impl.dart';
import '../lib/usecases/student_usecase.dart';
import '../lib/presentation/menu.dart';

void main() {
  final db = AppDatabase();
  final repo = StudentRepositoryImpl(db);
  final usecase = StudentUseCase(repo);

  showMenu(usecase);
}
