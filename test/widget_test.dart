import 'package:flutter_test/flutter_test.dart';
import 'package:shumiplayapp/main.dart';

void main() {
  testWidgets('App launches', (WidgetTester tester) async {
    await tester.pumpWidget(const ShumiPlayApp());
    expect(find.text('ShumiPlay!'), findsOneWidget);
  });
}
