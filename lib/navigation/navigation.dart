// ============================================================================
// File: navigation.dart
// Description: Navigation Drawer — provides side navigation options
//              for the application.
//
// REQUIREMENT 6: Navigation Drawer
//   - Implement Drawer or NavigationDrawer to provide additional
//     navigation options:
//       • Home
//       • Student Information
//       • Student Records
//       • About
//       • Settings (optional extra page)
//
// REQUIREMENT 7: Bottom Navigation (implemented in main.dart)
//   - The BottomNavigationBar / NavigationBar is already implemented
//     in main.dart's MainShell widget.
//   - This file handles the Drawer only.
//
// INSTRUCTIONS FOR DEVELOPER:
//   1. This widget extends ConsumerWidget (Riverpod) so it has access
//      to `ref` for reading/writing the provider.
//   2. Build a Drawer with a DrawerHeader containing:
//       - App name ("StudentHub")
//       - App icon or logo
//       - A subtitle or tagline
//   3. Add ListTile items for each navigation destination:
//       - Home (index 0)
//       - Student Information (index 1)
//       - Student Records (index 2)
//       - About (index 3)
//       - (Optional) Settings
//   4. On tap, update the provider's selectedIndex and close the drawer:
//       ref.read(studentProvider.notifier).setSelectedIndex(index);
//       Navigator.pop(context); // close drawer
//   5. Highlight the currently selected item using notifier.selectedIndex.
//
// RIVERPOD USAGE:
//   - READ data:    final notifier = ref.watch(studentProvider);
//   - MUTATE state: ref.read(studentProvider.notifier).setSelectedIndex(0);
//
// EXAMPLE SNIPPET:
//   Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         DrawerHeader(
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.primary,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Icon(Icons.school, size: 48, color: Colors.white),
//               SizedBox(height: 8),
//               Text('StudentHub',
//                 style: TextStyle(color: Colors.white, fontSize: 24)),
//               Text('Student Management App',
//                 style: TextStyle(color: Colors.white70)),
//             ],
//           ),
//         ),
//         ListTile(
//           leading: const Icon(Icons.home),
//           title: const Text('Home'),
//           selected: notifier.selectedIndex == 0,
//           onTap: () {
//             ref.read(studentProvider.notifier).setSelectedIndex(0);
//             Navigator.pop(context);
//           },
//         ),
//         // ... more ListTiles for other pages
//       ],
//     ),
//   )
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/student_provider.dart';

class AppNavigationDrawer extends ConsumerWidget {
  const AppNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement the Navigation Drawer
    // Access the provider: final notifier = ref.watch(studentProvider);
    // Build Drawer with DrawerHeader and ListTile items.
    // On tap: ref.read(studentProvider.notifier).setSelectedIndex(index);
    //         Navigator.pop(context);

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
          // TODO: Add navigation ListTile items here
          // Each ListTile should update the provider index and close drawer
          const ListTile(
            leading: Icon(Icons.construction),
            title: Text('Navigation items to be implemented'),
          ),
        ],
      ),
    );
  }
}
