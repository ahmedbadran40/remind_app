import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_strings.dart';
import 'package:reminde_app/screens/privacy_policy_screen.dart';
import 'package:reminde_app/screens/terms_of_service_screen.dart';
import 'package:reminde_app/utils/app_actions.dart';
import 'package:reminde_app/widgets/settings_tile.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsTile(
          title: AppStrings.privacyPolicyTitle,

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
          title: AppStrings.termsOfService,
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
          title: AppStrings.rateApp,
          onTap: () {
            AppActions.rateApp();
          },
        ),
        SizedBox(height: 24.h),
        SettingsTile(
          title: AppStrings.shareWithFriends,
          onTap: () {
            AppActions.shareApp();
          },
        ),
      ],
    );
  }
}
