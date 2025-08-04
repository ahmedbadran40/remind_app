import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_strings.dart';
import 'package:reminde_app/widgets/dark_mode_title.dart';
import 'package:reminde_app/widgets/exit_app_tile.dart';
import 'package:reminde_app/widgets/settings_group.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          AppStrings.settingsTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DarkModeTile(),
            SizedBox(height: 20.h),
            SettingsGroup(),
            SizedBox(height: 50.h),
            ExitAppTile(),
          ],
        ),
      ),
    );
  }
}
