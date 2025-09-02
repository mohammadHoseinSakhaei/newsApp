import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:newsapp/feature/data/model/local/article_local_model.dart';
import 'package:path_provider/path_provider.dart';

@LazySingleton()
class IsarService {
  Isar? _isar;

  Isar get instance {
    if (_isar == null) {
      throw Exception("Isar has not been initialized. Call initialize() first.");
    }
    return _isar!;
  }

  Future<void> initialize() async {
    if (_isar != null) return;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ArticleLocalSchema],
      directory: dir.path,
      inspector: true,
    );
  }

  Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}
