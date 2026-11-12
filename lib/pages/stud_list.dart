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
// ============================================================================

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/student_provider.dart';
import '../models/student.dart';
import 'stud_info.dart';

class StudentListPage extends ConsumerStatefulWidget {
  const StudentListPage({super.key});

  @override
  ConsumerState<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends ConsumerState<StudentListPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Filter students by name, matric number, or programme.
  List<Student> _filterStudents(List<Student> students) {
    if (_searchQuery.isEmpty) return students;
    final query = _searchQuery.toLowerCase();
    return students.where((s) {
      return s.name.toLowerCase().contains(query) ||
          s.matricNumber.toLowerCase().contains(query) ||
          s.programme.toLowerCase().contains(query);
    }).toList();
  }

  /// Pick a colour from a fixed palette based on the student's name hash,
  /// giving each avatar a consistent, distinct colour.
  Color _avatarColor(String name) {
    const palette = [
      Color(0xFF1565C0), // Blue
      Color(0xFF00897B), // Teal
      Color(0xFF6A1B9A), // Purple
      Color(0xFFC62828), // Red
      Color(0xFFEF6C00), // Orange
      Color(0xFF2E7D32), // Green
      Color(0xFF4527A0), // Deep Purple
      Color(0xFF00838F), // Cyan
      Color(0xFFAD1457), // Pink
      Color(0xFF558B2F), // Light Green
    ];
    return palette[name.hashCode.abs() % palette.length];
  }

  /// Return the initials (up to two characters) for the avatar.
  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(studentProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filteredStudents = _filterStudents(notifier.students);

    return Column(
      children: [
        // -----------------------------------------------------------------
        // Search / Filter Bar
        // -----------------------------------------------------------------
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search by name, matric no. or programme…',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _searchQuery = '');
                      },
                    )
                  : null,
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.5,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
            onChanged: (value) => setState(() => _searchQuery = value),
          ),
        ),

        // Student count summary
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              Icon(Icons.people, size: 18, color: colorScheme.primary),
              const SizedBox(width: 6),
              Text(
                _searchQuery.isEmpty
                    ? '${filteredStudents.length} students'
                    : '${filteredStudents.length} of ${notifier.students.length} students',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        const Divider(height: 1),

        // -----------------------------------------------------------------
        // Student ListView
        // -----------------------------------------------------------------
        Expanded(
          child: filteredStudents.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 64,
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'No students found',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Try a different search term',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: filteredStudents.length,
                  separatorBuilder: (_, _) =>
                      const Divider(height: 1, indent: 72),
                  itemBuilder: (context, index) {
                    final student = filteredStudents[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      // ---- Profile icon ----
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: _avatarColor(student.name),
                        child: Text(
                          _initials(student.name),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      // ---- Student name ----
                      title: Text(
                        student.name,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // ---- Matric number & programme ----
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              student.matricNumber,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              student.programme,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      // ---- Navigate to details page ----
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StudentInfoPage(student: student),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
