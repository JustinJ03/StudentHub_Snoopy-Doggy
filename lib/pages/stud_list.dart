// ============================================================================
// File: stud_list.dart
// Description: Student Information Page — displays a list of students
//              using ListView and ListTile.
//
// REQUIREMENT 2: Student Information Page
//   - Display a list of students using ListView and ListTile.
//   - Each student item should include:
//       • Student name
//       • Matric number
//       • Programme
//       • Profile icon or image (CircleAvatar)
//   - On tap, navigate to StudentInfoPage (stud_info.dart).
//
// INSTRUCTIONS FOR DEVELOPER:
//   1. This widget extends ConsumerWidget (Riverpod) so it has access
//      to `ref` for reading providers.
//   2. Use ref.watch(studentProvider) to access the student list.
//   3. Build a ListView.builder with ListTile for each student.
//   4. Each ListTile should have:
//       - leading: CircleAvatar with student initial or icon
//       - title: student name
//       - subtitle: matric number + programme
//       - onTap: navigate to StudentInfoPage (stud_info.dart)
//         passing the selected student object.
//   5. Optionally add a search/filter bar at the top.
//
// RIVERPOD USAGE:
//   - READ data:    final notifier = ref.watch(studentProvider);
//   - MUTATE state: ref.read(studentProvider.notifier).someMethod();
//
// EXAMPLE SNIPPET:
//   ListView.builder(
//     itemCount: notifier.students.length,
//     itemBuilder: (context, index) {
//       final student = notifier.students[index];
//       return ListTile(
//         leading: CircleAvatar(child: Text(student.name[0])),
//         title: Text(student.name),
//         subtitle: Text('${student.matricNumber} • ${student.programme}'),
//         onTap: () {
//           // TODO: Navigate to StudentInfoPage with student data
//         },
//       );
//     },
//   )
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/student_provider.dart';
import '../models/student.dart';

// import 'stud_info.dart'; // Uncomment when stud_info.dart is implemented

class StudentListPage extends ConsumerWidget {
  const StudentListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement the Student List Page
    // Access students: final notifier = ref.watch(studentProvider);
    // Build a ListView.builder with ListTile for each student.
    // On tap, navigate to StudentInfoPage (stud_info.dart).

    return const Center(
      child: Text(
        'Student List Page\n(To be implemented)',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
