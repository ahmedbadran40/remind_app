import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyButton extends StatelessWidget {
  const PrivacyPolicyButton({super.key});

  final String _privacyUrl =
      'https://doc-hosting.flycricket.io/remind-privacy-policy/d41b5446-8055-4f1e-8d35-0cb802afe38e/privacy'; // 🔁 Replace with actual link

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
      label: const Text("Open Privacy Policy"),
    );
  }
}
