import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class AppActions {
  static Future<void> rateApp() async {
    final Uri url = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.example.reminder_app',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  static void shareApp() {
    SharePlus.instance.share(
      ShareParams(
        text:
            'Check out this amazing app! 👇\nhttps://play.google.com/store/apps/details?id=com.example.reminder_app',
      ),
    );
  }
}
