import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/common/text_styles.dart';
import 'package:game_of_thrones/widgets/houses/house_item.dart';
import 'package:game_of_thrones/widgets/houses/house_list_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HouseListScreen extends ConsumerWidget {
  final int type;

  const HouseListScreen({required this.type});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final houses = watch(housesFutureProvider(type));

    return Scaffold(
      body: SafeArea(
        child: houses.when(
          data: (data) => _manageState(data),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (_, __) =>
              Text('Ha ocurrido un error, por favor, inténtelo más tarde'),
        ),
      ),
    );
  }

  Widget _manageState(BaseListState state) {
    if (state is Result) {
      return ListView.builder(
          itemCount: state.result.length,
          itemBuilder: (context, index) =>
              HouseItem(house: state.result[index]));
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
