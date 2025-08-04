import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_strings.dart';

class ExitAppTile extends StatelessWidget {
  const ExitAppTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      title: const Text(
        AppStrings.exitApp,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
      trailing: const Icon(Icons.exit_to_app, color: Colors.red),
      onTap: () => exit(0),
    );
  }
}
