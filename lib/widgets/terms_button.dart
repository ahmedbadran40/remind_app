import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsOfServiceButton extends StatelessWidget {
  const TermsOfServiceButton({super.key});

  final String _termsUrl =
      'https://doc-hosting.flycricket.io/remind-terms-of-use/40fe9992-6587-436d-9bcd-5ce834ad8b03/terms'; // 🔁 Replace with actual link

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(_termsUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch \$url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _launchUrl,
      icon: const Icon(Icons.description),
      label: const Text("Open Terms of Service"),
    );
  }
}
