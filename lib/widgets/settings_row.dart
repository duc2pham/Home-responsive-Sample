import 'package:flutter/material.dart';

import 'settings_item.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: mockItems.map((i) => SettingsItem(icon: i)).toList()
    );
  }
}
