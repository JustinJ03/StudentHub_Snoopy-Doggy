import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/navigation_provider.dart';

/// Navigation Drawer Widget
class AppNavigationDrawer extends ConsumerWidget {
  const AppNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navState = ref.watch(navigationProvider);
    final selectedIndex = navState.currentIndex;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.school, size: 48, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  'StudentHub',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Student Management App',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: const Text('Home'),
            selected: selectedIndex == 0,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_rounded),
            title: const Text('Student Information'),
            selected: selectedIndex == 1,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.table_chart_rounded),
            title: const Text('Student Records'),
            selected: selectedIndex == 2,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.category_rounded),
            title: const Text('Programmes / Categories'),
            selected: selectedIndex == 3,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(3);
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('About App'),
            selected: selectedIndex == 4,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(4);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            selected: selectedIndex == 5,
            onTap: () {
              ref.read(navigationProvider.notifier).setIndex(5);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

/// Bottom Navigation Bar Widget
class AppBottomNavigationBar extends ConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navState = ref.watch(navigationProvider);
    final currentIndex = navState.currentIndex;

    // Safety fallback: prevents crash if user opens About (4) or Settings (5) from drawer
    final barIndex = currentIndex < 4 ? currentIndex : 0;

    return NavigationBar(
      selectedIndex: barIndex,
      onDestinationSelected: (int index) {
        ref.read(navigationProvider.notifier).setIndex(index);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.people_outline_rounded),
          selectedIcon: Icon(Icons.people_alt_rounded),
          label: 'Students',
        ),
        NavigationDestination(
          icon: Icon(Icons.table_chart_outlined),
          selectedIcon: Icon(Icons.table_chart_rounded),
          label: 'Records',
        ),
        NavigationDestination(
          icon: Icon(Icons.category_outlined),
          selectedIcon: Icon(Icons.category_rounded),
          label: 'Programmes',
        ),
      ],
    );
  }
}
