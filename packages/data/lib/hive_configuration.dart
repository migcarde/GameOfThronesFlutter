import 'package:data/operations/categories/category_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initConfiguration() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryHiveModelAdapter());
}
