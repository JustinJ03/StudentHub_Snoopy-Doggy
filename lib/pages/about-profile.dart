// ============================================================================
// File: about-profile.dart
// Description: Profile / About Page — displays application or developer
//              information with an attractive layered interface.
//
// REQUIREMENT 8: Profile / About Page
//   - Display relevant application or developer information.
//   - Use the Stack widget to create an attractive profile header
//     or layered interface by placing text, icons, and images
//     on top of each other.
//
// INSTRUCTIONS FOR DEVELOPER:
//   1. Create a profile header using Stack widget:
//       - Background: a gradient Container or an image.
//       - Overlay: CircleAvatar with developer photo/icon.
//       - Overlay: Developer name and role text.
//   2. Below the Stack header, display:
//       - App name, version, and description.
//       - Developer/team information (names, IDs, roles).
//       - Course information (e.g., "SELAB", section, semester).
//       - Contact information or social links.
//   3. Use Cards to organise sections.
//   4. Optionally add the UTM logo or Faculty of Computing logo.
//
// NOTE: This page likely does NOT need Riverpod unless it reads
//       shared state. Use StatelessWidget or ConsumerWidget as needed.
//
// EXAMPLE SNIPPET — Stack Profile Header:
//   Stack(
//     alignment: Alignment.center,
//     clipBehavior: Clip.none,
//     children: [
//       // Background Banner
//       Container(
//         height: 200,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue.shade700, Colors.blue.shade400],
//           ),
//         ),
//       ),
//       // Profile Avatar (positioned to overlap)
//       Positioned(
//         bottom: -40,
//         child: CircleAvatar(
//           radius: 50,
//           backgroundColor: Colors.white,
//           child: CircleAvatar(
//             radius: 46,
//             child: Icon(Icons.person, size: 50),
//           ),
//         ),
//       ),
//     ],
//   )
//
// EXAMPLE SNIPPET — Developer Info Card:
//   Card(
//     child: ListTile(
//       leading: CircleAvatar(child: Text('D1')),
//       title: Text('Developer Name'),
//       subtitle: Text('A22EC0XXX • Role'),
//     ),
//   )
// ============================================================================

import 'package:flutter/material.dart';

class AboutProfilePage extends StatelessWidget {
  const AboutProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the About/Profile Page
    // Use Stack widget for a layered profile header.
    // Display app info and developer/team details.

    return const Center(
      child: Text(
        'About / Profile Page\n(To be implemented)\n\n'
        'Requirements:\n'
        '• Stack widget for profile header\n'
        '• App information\n'
        '• Developer/team details',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
