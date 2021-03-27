import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_of_thrones/main_screen_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final categories = watch(categoriesFuture);

    return Container(
      child: categories.when(
          data: (data) => Text('HURRA'),
          loading: () => CircularProgressIndicator(),
          error: (_, __) => Text('No response')),
    );
  }
}
