import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.shade200,
                    child: const Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Settings Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  // Toggle: Night Mode
                  _SettingsToggleItem(
                    icon: Icons.nightlight_round,
                    label: 'Night mode',
                    value: isDarkMode,
                    onChanged: (val) => setState(() => isDarkMode = val),
                  ),
                  _SettingsToggleItem(
                    icon: Icons.notifications,
                    label: 'Notifications',
                    value: isNotificationEnabled,
                    onChanged: (val) => setState(() => isNotificationEnabled = val),
                  ),

                  const SizedBox(height: 12),

                  // Navigation items
                  const _SettingsNavItem(icon: Icons.language, label: 'the language'),
                  const _SettingsNavItem(icon: Icons.lock_outline, label: 'change password'),
                  const _SettingsNavItem(icon: Icons.phone, label: 'Change phone'),
                  const _SettingsNavItem(icon: Icons.lock, label: 'Terms and Conditions'),
                  const _SettingsNavItem(icon: Icons.location_on, label: 'Registered addresses'),
                  const _SettingsNavItem(icon: Icons.chat_bubble_outline, label: 'Contact us'),

                  const SizedBox(height: 32),

                  // Log out
                  GestureDetector(
                    onTap: () {
                      // Handle log out
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: 16),
                        Text(
                          'Log out',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Toggle Item Widget
class _SettingsToggleItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsToggleItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Color(0xFF6C5DD3)),
      title: Text(label),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Color(0xFF6C5DD3),
      ),
    );
  }
}

// Navigation Item Widget
class _SettingsNavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SettingsNavItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Color(0xFF6C5DD3)),
      title: Text(label),
      onTap: () {
        // Handle navigation
      },
    );
  }
}
