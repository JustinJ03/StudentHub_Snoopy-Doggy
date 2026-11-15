// ============================================================================
// File: settings.dart
// Description: Settings Page — manages application preferences and Dark Mode
//              theme state for StudentHub.
// ============================================================================

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Shared Riverpod provider for Dark Mode state
final darkModeProvider = StateProvider<bool>((ref) => false);

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(darkModeProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), elevation: 2),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---------------------------------------------------------------
          // Appearance Section (Dark Mode Only)
          // ---------------------------------------------------------------
          Text(
            'Appearance',
            style: theme.textTheme.titleSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: colorScheme.outlineVariant),
            ),
            child: SwitchListTile(
              secondary: const Icon(Icons.dark_mode_outlined),
              title: const Text('Dark Mode'),
              subtitle: const Text('Use dark theme across the app'),
              value: isDarkMode,
              onChanged: (val) {
                ref.read(darkModeProvider.notifier).state = val;
              },
            ),
          ),

          const SizedBox(height: 20),

          // ---------------------------------------------------------------
          // Preferences Section
          // ---------------------------------------------------------------
          Text(
            'Preferences',
            style: theme.textTheme.titleSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: colorScheme.outlineVariant),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.notifications_outlined),
                  title: const Text('Notifications'),
                  subtitle: const Text('Receive student record updates'),
                  value: _notificationsEnabled,
                  onChanged: (val) =>
                      setState(() => _notificationsEnabled = val),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.restore, color: colorScheme.error),
                  title: Text(
                    'Reset Preferences',
                    style: TextStyle(color: colorScheme.error),
                  ),
                  subtitle: const Text('Restore default app settings'),
                  onTap: () {
                    ref.read(darkModeProvider.notifier).state = false;
                    setState(() {
                      _notificationsEnabled = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Preferences reset to default'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ---------------------------------------------------------------
          // Application Info Section
          // ---------------------------------------------------------------
          Text(
            'Application',
            style: theme.textTheme.titleSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: colorScheme.outlineVariant),
            ),
            child: const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.school_outlined),
                  title: Text('StudentHub'),
                  subtitle: Text('TMA3084 Software Engineering Lab'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Version'),
                  subtitle: Text('1.0.0 • Team Snoppy Doggy'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
