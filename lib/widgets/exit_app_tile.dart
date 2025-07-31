import 'package:flutter/material.dart';
import 'dart:io';

class ExitAppTile extends StatelessWidget {
  const ExitAppTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.red[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text(
        'Exit App',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
      trailing: const Icon(Icons.exit_to_app, color: Colors.red),
      onTap: () => exit(0),
    );
  }
}
