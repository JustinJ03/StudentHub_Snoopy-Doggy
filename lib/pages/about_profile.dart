// =============================================================================
// File: about_profile.dart
// Description: Profile / About page with layered (Stack) header,
// app information and the development team list
// Requirement 8: Profile / About Page
// =============================================================================

import 'package:material_ui/material_ui.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const List<_Member> _members = [
    _Member(name: 'Justin Joel', matric: '104607', role: 'Home Page'),
    _Member(
      name: 'Jazzier Joane',
      matric: '104507',
      role: 'Student Info & details',
    ),
    _Member(
      name: 'Alan Isam',
      matric: '103166',
      role: 'Student record & category/programme',
    ),
    _Member(
      name: 'Isabella Roselinni',
      matric: '104426',
      role: 'Navigation drawer & bottom navigation',
    ),
    _Member(
      name: 'Wong Weng Mun',
      matric: '106728',
      role: 'Profile/About & share state',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        const _ProfileHeader(),
        const SizedBox(height: 12),
        Center(child: Text('StudentHub', style: textTheme.headlineMedium)),
        Center(child: Text('Your Student Portal', style: textTheme.bodyMedium)),
        const SizedBox(height: 16),
        const _InfoCard(
          title: 'About the app',
          children: [
            _InfoRow(
              icon: Icons.info_outline,
              label: 'Version',
              value: '1.0.0',
            ),
            _InfoRow(
              icon: Icons.school_outlined,
              label: 'Course',
              value: 'TMA3084 Software Engineering Lab',
            ),
          ],
        ),
        _InfoCard(
          title: 'Development team -- Snoppy Doggy',
          children: [
            for (final member in _members) _MemberTile(member: member),
          ],
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 230,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [scheme.primary, scheme.tertiary],
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 24,
            child: Icon(
              Icons.menu_book,
              size: 48,
              color: scheme.onPrimary.withAlpha(90),
            ),
          ),
          Positioned(
            top: 40,
            right: 28,
            child: Icon(
              Icons.school,
              size: 64,
              color: scheme.onPrimary.withAlpha(90),
            ),
          ),
          Positioned(
            top: 28,
            child: Text(
              'Meet the team',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: scheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CircleAvatar(
              radius: 54,
              backgroundColor: scheme.surface,
              child: CircleAvatar(
                radius: 48,
                backgroundColor: scheme.primaryContainer,
                child: Icon(
                  Icons.person,
                  size: 56,
                  color: scheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

class _Member {
  const _Member({required this.name, required this.matric, required this.role});

  final String name;
  final String matric;
  final String role;
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.member});

  final _Member member;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(child: Text(member.name[0])),
      title: Text(member.name),
      subtitle: SelectableText('${member.matric} • ${member.role}'),
    );
  }
}
