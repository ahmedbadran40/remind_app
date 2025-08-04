import 'package:flutter/material.dart';
import 'package:reminde_app/core/constants/app_links.dart';
import 'package:reminde_app/core/constants/app_strings.dart';

import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyButton extends StatelessWidget {
  const PrivacyPolicyButton({super.key});

  final String _privacyUrl = AppLinks.privacyPolicyUrl;

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(_privacyUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch \$url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _launchUrl,
      icon: const Icon(Icons.language),
      label: const Text(AppStrings.openPrivacyPolicy),
    );
  }
}
