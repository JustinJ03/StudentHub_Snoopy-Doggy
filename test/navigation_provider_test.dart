import 'package:flutter_test/flutter_test.dart';

import 'package:student_hub/providers/navigation_provider.dart';

void main() {
  group('NavigationProvider', () {
    test('Starts at index 0', () {
      expect(NavigationProvider().currentIndex, 0);
    });

    test('setIndex updates index and notifies listeners', () {
      final nav = NavigationProvider();
      var notified = 0;
      nav.addListener(() => notified++);

      nav.setIndex(2);

      expect(nav.currentIndex, 2);
      expect(notified, 1);
    });

    test('ignores same and out-of-range indexes', () {
      final nav = NavigationProvider();
      var notified = 0;
      nav.addListener(() => notified++);

      nav.setIndex(0);
      nav.setIndex(-1);
      nav.setIndex(NavigationProvider.destinationCount);

      expect(nav.currentIndex, 0);
      expect(notified, 0);
    });
  });
}
