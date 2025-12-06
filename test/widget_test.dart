import 'package:flutter_test/flutter_test.dart';
import 'package:magazinemaker/main.dart';

void main() {
  testWidgets('MagazineMaker renders main text', (WidgetTester tester) async {
    await tester.pumpWidget(const MagazineMakerApp());
    expect(find.text('Hello, MagazineMaker!'), findsOneWidget);
  });
}
