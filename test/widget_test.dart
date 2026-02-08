
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/main.dart';

void main() {
  testWidgets('GroceryApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GroceryApp());

    // Verify that the title shows up
    expect(find.text('Grocery List'), findsOneWidget);
    expect(find.text('My List'), findsOneWidget);
    expect(find.text('Catalog'), findsOneWidget);
  });
}
