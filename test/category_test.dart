import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_thrones/widgets/categories/category_item.dart';
import 'package:game_of_thrones/widgets/categories/category_view_entity.dart';

void main() {
  final categoryViewEntity = CategoryViewEntity(categoryName: 'T', type: 0);
  testWidgets('Category item test', (WidgetTester tester) async {
    await tester.pumpWidget(CategoryItem(
      category: categoryViewEntity,
      onClick: (index) => null,
    ));

    expect(find.text(categoryViewEntity.categoryName), findsOneWidget);
  });
}
