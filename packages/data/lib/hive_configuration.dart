import 'package:data/categories/category_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void initConfiguration() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(CategoryHiveModelAdapter());
}
