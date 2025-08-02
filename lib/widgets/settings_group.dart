import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/screens/privacy_policy_screen.dart';
import 'package:reminder_app/screens/terms_of_service_screen.dart';
import 'package:reminder_app/utils/app_actions.dart';
import 'package:reminder_app/widgets/settings_tile.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsTile(
          title: 'Privacy Policy',

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PrivacyPolicyScreen();
                },
              ),
            );
          },
        ),
        SizedBox(height: 24.h),
        SettingsTile(
          title: 'Terms of Service',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TermsOfServiceScreen();
                },
              ),
            );
          },
        ),
        SizedBox(height: 24.h),
        SettingsTile(
          title: 'Rate the App',
          onTap: () {
            AppActions.rateApp();
          },
        ),
        SizedBox(height: 24.h),
        SettingsTile(
          title: 'Share with Friends',
          onTap: () {
            AppActions.shareApp();
          },
        ),
      ],
    );
  }
}
