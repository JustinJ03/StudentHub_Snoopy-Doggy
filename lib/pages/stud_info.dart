// ============================================================================
// File: stud_info.dart
// Description: Student Details Page — displays a selected student's
//              detailed information.
//
// REQUIREMENT 3: Student Details Page
//   - When a user selects a student from the list (stud_list.dart),
//     display the student's detailed information on this page.
//   - Use appropriate widgets to organise the content (Card, Column, Row).
//   - Include SelectableText for matric number and email address
//     so users can select and copy them.
// ============================================================================

import 'package:material_ui/material_ui.dart';

import '../models/student.dart';

class StudentInfoPage extends StatelessWidget {
  final Student student;

  const StudentInfoPage({super.key, required this.student});

  /// Pick a colour from a fixed palette based on the student's name hash.
  Color _avatarColor(String name) {
    const palette = [
      Color(0xFF1565C0),
      Color(0xFF00897B),
      Color(0xFF6A1B9A),
      Color(0xFFC62828),
      Color(0xFFEF6C00),
      Color(0xFF2E7D32),
      Color(0xFF4527A0),
      Color(0xFF00838F),
      Color(0xFFAD1457),
      Color(0xFF558B2F),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final avatarBg = _avatarColor(student.name);

    return Scaffold(
      appBar: AppBar(title: const Text('Student Details'), elevation: 2),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ---------------------------------------------------------------
            // Profile Header
            // ---------------------------------------------------------------
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorScheme.primary, colorScheme.primaryContainer],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Column(
                children: [
                  // Profile avatar
                  CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: avatarBg,
                      child: Text(
                        _initials(student.name),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Student name
                  Text(
                    student.name,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Programme badge
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      student.programme,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------------------------------------------------------------
            // Personal Information Card
            // ---------------------------------------------------------------
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: colorScheme.outlineVariant),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: colorScheme.primary),
                        const SizedBox(width: 8),
                        Text(
                          'Personal Information',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    _DetailRow(
                      icon: Icons.badge,
                      label: 'Matric Number',
                      child: SelectableText(
                        student.matricNumber,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DetailRow(
                      icon: Icons.email,
                      label: 'Email',
                      child: SelectableText(
                        student.email,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.blue.shade700,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DetailRow(
                      icon: Icons.phone,
                      label: 'Phone',
                      child: SelectableText(
                        student.phone,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ---------------------------------------------------------------
            // Academic Information Card
            // ---------------------------------------------------------------
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: colorScheme.outlineVariant),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.school, color: colorScheme.primary),
                        const SizedBox(width: 8),
                        Text(
                          'Academic Information',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    _DetailRow(
                      icon: Icons.computer,
                      label: 'Programme',
                      child: Text(
                        student.programme,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DetailRow(
                      icon: Icons.account_balance,
                      label: 'Faculty',
                      child: Text(
                        student.faculty,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DetailRow(
                      icon: Icons.calendar_today,
                      label: 'Year of Study',
                      child: Text(
                        'Year ${student.year}',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DetailRow(
                      icon: Icons.trending_up,
                      label: 'CGPA',
                      child: _CgpaBadge(cgpa: student.cgpa),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// _DetailRow — a single labelled field with an icon, label, and value widget.
// =============================================================================
class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget child;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              child,
            ],
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// _CgpaBadge — a coloured badge that indicates CGPA standing.
// =============================================================================
class _CgpaBadge extends StatelessWidget {
  final double cgpa;

  const _CgpaBadge({required this.cgpa});

  @override
  Widget build(BuildContext context) {
    final Color badgeColor;
    final String standing;
    if (cgpa >= 3.75) {
      badgeColor = Colors.green.shade700;
      standing = "Dean's List";
    } else if (cgpa >= 3.50) {
      badgeColor = Colors.blue.shade700;
      standing = 'First Class';
    } else if (cgpa >= 3.00) {
      badgeColor = Colors.orange.shade700;
      standing = 'Second Class Upper';
    } else {
      badgeColor = Colors.red.shade700;
      standing = 'Below 3.00';
    }

    return Row(
      children: [
        Text(
          cgpa.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold, color: badgeColor),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: badgeColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            standing,
            style: Theme.of(context).textTheme.labelSmall
                ?.copyWith(color: badgeColor, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
