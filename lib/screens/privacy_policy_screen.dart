import 'package:flutter/material.dart';
import 'package:reminde_app/core/constants/app_strings.dart';
import 'package:reminde_app/widgets/privacy_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          AppStrings.privacyPolicyTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),

          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(child: PrivacyPolicyButton()),
    );
  }
}
