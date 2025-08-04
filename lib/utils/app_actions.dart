import 'package:reminde_app/core/constants/app_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class AppActions {
  static Future<void> rateApp() async {
    final Uri url = Uri.parse(AppLinks.playStoreUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  static void shareApp() {
    SharePlus.instance.share(ShareParams(text: AppLinks.shareAppText));
  }
}
