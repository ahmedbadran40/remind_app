import 'package:flutter/material.dart';

class DarkModeTile extends StatelessWidget {
  const DarkModeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: const Color(0xFFF9EEDC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text(
        'Dark Mode',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Switch(
        value: false,
        onChanged: (value) {
          // TODO: Add dark mode logic
        },
      ),
    );
  }
}
