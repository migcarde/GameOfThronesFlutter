import 'package:flutter/material.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/common/text_styles.dart';
import 'package:game_of_thrones/widgets/chars/char_item.dart';
import 'package:game_of_thrones/widgets/chars/char_list_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharListScreen extends ConsumerWidget {
  final int type;

  CharListScreen({required this.type});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final chars = watch(charsFutureProvider(type));

    return Scaffold(
      body: SafeArea(
        child: chars.when(
          data: (state) => _manageState(state),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (_, __) => Text('Ha ocurrido un error'),
        ),
      ),
    );
  }

  Widget _manageState(BaseListState state) {
    if (state is Result) {
      return ListView.builder(
        itemCount: state.result.length,
        itemBuilder: (context, index) => CharItem(
          char: state.result[index],
        ),
      );
    } else if (state is Empty) {
      return Center(
        child: Text(
          'La lista esta vacía',
          style: TextStyles.boldText(),
        ),
      );
    } else {
      final error = state as Error;

      return Center(
        child: Text(error.message),
      );
    }
  }
}
