import 'package:flutter/material.dart';

import 'settings_item.dart';

class SettingsColumn extends StatelessWidget {
  const SettingsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: mockItems.map((i) => SettingsItem(icon: i)).toList());
  }
}
