//=============================================================================
// File: navigation_provider.dart
// Description: Shared navigation state (selected bottom-nav / drawer index).
// Requirement 9: Shared State Management (Riverpod)
// ============================================================================

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = ChangeNotifierProvider<NavigationProvider>(
    (ref) => NavigationProvider(),
);

class NavigationProvider extends ChangeNotifier {
  NavigationProvider({int initialIndex = 0})
      : assert(initialIndex >= 0 && initialIndex < destinationCount),
        _currentIndex = initialIndex;

  static const int destinationCount = 4;

  int _currentIndex;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (index < 0 || index >= destinationCount) return;
    if (index == _currentIndex) return;
    _currentIndex = index;
    notifyListeners();
  }
}
