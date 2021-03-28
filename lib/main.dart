import 'package:common_flutter/app_config.dart';
import 'package:flutter/material.dart';
import 'package:game_of_thrones/main_screen.dart';
import 'package:game_of_thrones/widgets/categories/category_list_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'injection_container.dart' as di;
import 'package:data/hive_configuration.dart' as hiveConfiguration;

void main() async {
  di.init();
  await hiveConfiguration.initConfiguration();
  AppConfig(
      flavorName: 'dev',
      baseUrl: 'private-anon-f7d0cd3499-androidtestmobgen.apiary-mock.com');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryListScreen(),
    );
  }
}
