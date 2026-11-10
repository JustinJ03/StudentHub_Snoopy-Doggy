import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_hub/main.dart';

void main() {
  testWidgets('StudentHub app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: StudentHubApp()));

    // Verify the app title is displayed
    expect(find.text('StudentHub'), findsWidgets);
  });
}
