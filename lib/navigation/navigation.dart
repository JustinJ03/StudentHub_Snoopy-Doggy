// ============================================================================
// File: navigation.dart
// Description: Navigation Drawer and Material 3 Bottom Navigation Bar.
// Requirement 6: Navigation Drawer
// Requirement 7: Bottom Navigation
// ============================================================================

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/navigation_provider.dart';
import '../pages/settings.dart';

/// Navigation Drawer Widget (Requirement 6)
class AppNavigationDrawer extends ConsumerWidget {
  const AppNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(
      navigationProvider.select((nav) => nav.currentIndex),
    );
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [colorScheme.primary, colorScheme.tertiary],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.school, size: 48, color: colorScheme.onPrimary),
                const SizedBox(height: 8),
                Text(
                  'StudentHub',
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Your Student Portal',
                  style: TextStyle(
                    color: colorScheme.onPrimary.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            selectedTileColor: colorScheme.primaryContainer,
            title: const Text('Home'),
            selected: selectedIndex == 0,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outline),
            selectedTileColor: colorScheme.primaryContainer,
            title: const Text('Student Information'),
            selected: selectedIndex == 1,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.table_chart_outlined),
            selectedTileColor: colorScheme.primaryContainer,
            title: const Text('Student Records'),
            selected: selectedIndex == 2,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            selectedTileColor: colorScheme.primaryContainer,
            title: const Text('About'),
            selected: selectedIndex == 3,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(3);
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Bottom Navigation Bar Widget (Requirement 7)
class AppBottomNavigationBar extends ConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(
      navigationProvider.select((nav) => nav.currentIndex),
    );

    final barIndex = currentIndex < 4 ? currentIndex : 0;

    return NavigationBar(
      selectedIndex: barIndex,
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
    );
  }
}
