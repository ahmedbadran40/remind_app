import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestNotificationPermission() async {
  if (!kIsWeb && await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
}
