// ============================================================================
// File: stud_record.dart
// Description: Student Records Page — displays student records in a DataTable
//              AND organises content by programme using TabBar/TabBarView.
//
// REQUIREMENT 4: Student Records Page (DataTable)
//   - DataTable with four columns: Name, Matric No, Programme, CGPA.
//   - Ten sample records (hardcoded mock data in studentProvider).
//   - Ascending/descending sorting on Name, Matric No and CGPA,
//     with the built-in sort arrow as the direction indicator.
//
// REQUIREMENT 5: Category / Programme Page (Tabs)
//   - DefaultTabController + TabBar + TabBarView.
//   - One "All" tab plus one tab per programme, each showing only
//     that programme's students.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/student.dart';
import '../providers/student_provider.dart';

class StudentRecordPage extends ConsumerStatefulWidget {
  const StudentRecordPage({super.key});

  @override
  ConsumerState<StudentRecordPage> createState() => _StudentRecordPageState();
}

class _StudentRecordPageState extends ConsumerState<StudentRecordPage> {
  // Sort state is shared by every tab, so switching tabs keeps the order.
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  void _onSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<Student> _sorted(List<Student> students) {
    final sorted = [...students];
    sorted.sort((a, b) {
      final result = switch (_sortColumnIndex) {
        0 => a.name.compareTo(b.name),
        1 => a.matricNumber.compareTo(b.matricNumber),
        3 => a.cgpa.compareTo(b.cgpa),
        _ => 0,
      };
      return _sortAscending ? result : -result;
    });
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(studentProvider);
    final programmes = notifier.programmes;

    return DefaultTabController(
      length: programmes.length + 1, // +1 for the "All" tab
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              const Tab(text: 'All'),
              for (final p in programmes) Tab(text: p),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildTable(notifier.students),
                for (final p in programmes)
                  _buildTable(notifier.getStudentsByProgramme(p)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable(List<Student> students) {
    // Vertical + horizontal scroll so the table fits on narrow phones.
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columns: [
            DataColumn(label: const Text('Name'), onSort: _onSort),
            DataColumn(label: const Text('Matric No'), onSort: _onSort),
            const DataColumn(label: Text('Programme')),
            DataColumn(
              label: const Text('CGPA'),
              numeric: true,
              onSort: _onSort,
            ),
          ],
          rows: [
            for (final s in _sorted(students))
              DataRow(
                cells: [
                  DataCell(Text(s.name)),
                  DataCell(Text(s.matricNumber)),
                  DataCell(Text(s.programme)),
                  DataCell(Text(s.cgpa.toStringAsFixed(2))),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
