// ============================================================================
// File: main.dart
// Description: Application entry point for StudentHub.
// Sets up Riverpod ProviderScope for shared state management
// and configures Material 3 theming.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/navigation_provider.dart';
import 'pages/home.dart';
import 'pages/stud_list.dart';
import 'pages/stud_record.dart';
import 'pages/about_profile.dart';
import 'navigation/navigation.dart';

void main() {
  runApp(
    /// Wrap the entire app with ProviderScope —
    /// the root of all Riverpod providers.
    const ProviderScope(child: StudentHubApp()),
  );
}

class StudentHubApp extends StatelessWidget {
  const StudentHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudentHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0), // Deep Blue
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MainShell(),
    );
  }
}

/// MainShell — the root scaffold that hosts:
///   • NavigationDrawer  (side)
///   • BottomNavigationBar (bottom)
///   • Page body that swaps based on selected index
///
/// Extends ConsumerWidget so it can use ref.watch to read Riverpod providers.
class MainShell extends ConsumerWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(
      navigationProvider.select((nav) => nav.currentIndex),
    );

    // Pages corresponding to each bottom-nav index
    const List<Widget> pages = [
      HomePage(), // index 0
      StudentListPage(), // index 1
      StudentRecordPage(), // index 2
      AboutPage(), // index 3
    ];

    return Scaffold(
      // --- App Bar ---
      appBar: AppBar(
        title: const Text(
          'StudentHub',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),

      // --- Navigation Drawer (Requirement 6) ---
      drawer: const AppNavigationDrawer(),

      // --- Body ---
      body: IndexedStack(index: currentIndex, children: pages),

      // --- Bottom Navigation Bar (Requirement 7) ---
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          ref.read(navigationProvider.notifier).setIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Students',
          ),
          NavigationDestination(
            icon: Icon(Icons.table_chart_outlined),
            selectedIcon: Icon(Icons.table_chart),
            label: 'Records',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
