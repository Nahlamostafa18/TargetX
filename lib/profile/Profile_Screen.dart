import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:targetx/edit_profile/EditProfileScreen.dart';

import '../help/HelpScreen.dart';
import '../help/Terms.dart';
import '../order_history/OrderHistoryScreen.dart';
import '../settings/SettingsScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header with background image and title
          Container(
            width: double.infinity,
            height: 180,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/gradient_bg.png'),
                // Replace with your image
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),

          // Profile card
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Personal Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/images/user_avatar.png'),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Omar Ali',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Points 85/100',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6C5DD3),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(
                            initialName: "Omar Ali",
                            initialPhone: "1234123123"),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFd9d9d9)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Center(
                        child: Text(
                          'Edit profile',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Menu items
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      _ProfileItem(
                        icon: Icons.settings,
                        text: 'Settings',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ));
                        },
                      ),
                      _ProfileItem(
                        icon: Icons.person_add_alt,
                        text: 'Invite a friend',
                        onTap: _inviteFriend,
                      ),
                      _ProfileItem(
                        icon: Icons.description_outlined,
                        text: 'Terms and Conditions',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TermsAndConditionsScreen(),
                              ));
                        },
                      ),
                      _ProfileItem(
                        icon: Icons.help_outline,
                        text: 'Need help!',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HelpScreen(),
                              ));
                        },
                      ),
                      _ProfileItem(
                        icon: Icons.chat_bubble_outline,
                        text: 'Frequently asked questions',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FAQPage(),
                              ));
                        },
                      ),
                      _ProfileItem(
                        icon: Icons.assignment_ind_outlined,
                        text: 'Your requests',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => OrderHistoryScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          // Edit Profile Button
        ],
      ),
    );
  }

  void _inviteFriend() {
    const url =
        'https://play.google.com/store/apps/details?id=com.example.targetx';
    SharePlus.instance
        .share(ShareParams(text: 'Check out TargetX on Google Play: $url'));
  }
}

class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const _ProfileItem({
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: Color(0xFF6C5DD3)),
      title: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
