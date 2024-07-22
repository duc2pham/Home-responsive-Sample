import 'package:flutter/material.dart';

const mockItems = [
  Icons.account_box,
  Icons.notifications,
  Icons.settings,
  Icons.search,
];

class SettingsItem extends StatelessWidget {
  const SettingsItem({required this.icon,super.key,});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        child: Icon(icon, size: 40),
        onTap: () {
          //TODO handle onTap
        },
      ),
    );
  }
}
