// ============================================================================
// File: stud_record.dart
// Description: Student Records Page — displays student records in a DataTable
//              AND organises content by programme using TabBar/TabBarView.
//
// REQUIREMENT 4: Student Records Page (DataTable)
//   - Display student records using the DataTable widget.
//   - The table must contain at least FOUR columns
//     (e.g., Name, Matric No, Programme, CGPA).
//   - Include at least TEN sample student records (already in provider).
//   - Implement ascending/descending sorting for at least TWO columns.
//   - Display a sorting indicator to show current sorting direction.
//
// REQUIREMENT 5: Category / Programme Page (Tabs)
//   - Implement DefaultTabController, TabBar, and TabBarView.
//   - Organise student info into different categories or academic programmes.
//   - Each tab must display its corresponding content.
//
// INSTRUCTIONS FOR DEVELOPER:
//   1. Use ConsumerStatefulWidget (Riverpod) to manage local sort state
//      while accessing global student data from the provider.
//   2. Use DefaultTabController to wrap the page content.
//   3. Create a TabBar with tabs for each programme
//      (e.g., "All", "Software Engineering", "Data Engineering", etc.).
//      Access programme list from: notifier.programmes
//   4. In each TabBarView child:
//       - Filter students by programme (or show all).
//       - Display a DataTable with columns:
//           • Name
//           • Matric Number
//           • Programme
//           • CGPA
//       - Implement onSort for at least 2 columns (Name, CGPA).
//       - Use DataColumn(label: ..., onSort: ...) with sortAscending.
//
// RIVERPOD USAGE:
//   - READ data:    final notifier = ref.watch(studentProvider);
//   - MUTATE state: ref.read(studentProvider.notifier).someMethod();
//
// EXAMPLE SNIPPET — DataTable with sorting:
//   DataTable(
//     sortColumnIndex: _sortColumnIndex,
//     sortAscending: _sortAscending,
//     columns: [
//       DataColumn(
//         label: const Text('Name'),
//         onSort: (columnIndex, ascending) {
//           setState(() {
//             _sortColumnIndex = columnIndex;
//             _sortAscending = ascending;
//             // Sort the list
//           });
//         },
//       ),
//       const DataColumn(label: Text('Matric No')),
//       const DataColumn(label: Text('Programme')),
//       DataColumn(
//         label: const Text('CGPA'),
//         numeric: true,
//         onSort: (columnIndex, ascending) { ... },
//       ),
//     ],
//     rows: students.map((s) => DataRow(cells: [
//       DataCell(Text(s.name)),
//       DataCell(Text(s.matricNumber)),
//       DataCell(Text(s.programme)),
//       DataCell(Text(s.cgpa.toStringAsFixed(2))),
//     ])).toList(),
//   )
//
// EXAMPLE SNIPPET — TabBar:
//   DefaultTabController(
//     length: programmes.length + 1, // +1 for "All" tab
//     child: Column(
//       children: [
//         TabBar(
//           isScrollable: true,
//           tabs: [
//             const Tab(text: 'All'),
//             ...programmes.map((p) => Tab(text: p)),
//           ],
//         ),
//         Expanded(
//           child: TabBarView(
//             children: [
//               _buildDataTable(allStudents),
//               ...programmes.map((p) =>
//                 _buildDataTable(notifier.getStudentsByProgramme(p))),
//             ],
//           ),
//         ),
//       ],
//     ),
//   )
// ============================================================================

// ignore_for_file: unused_import
// remove this when your code has been implemented

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/student_provider.dart';
import '../models/student.dart';

class StudentRecordPage extends ConsumerStatefulWidget {
  const StudentRecordPage({super.key});

  @override
  ConsumerState<StudentRecordPage> createState() => _StudentRecordPageState();
}

class _StudentRecordPageState extends ConsumerState<StudentRecordPage> {
  // TODO: Add sort state variables
  // int _sortColumnIndex = 0;
  // bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the Student Records Page with DataTable and TabBar
    // Access students: final notifier = ref.watch(studentProvider);

    return const Center(
      child: Text(
        'Student Records Page\n(To be implemented)\n\n'
        'Requirements:\n'
        '• DataTable with 4+ columns\n'
        '• 10 sample records\n'
        '• Sorting on 2+ columns\n'
        '• TabBar by programme',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
