import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reminde_app/core/constants/theme/themes.dart';
import 'package:reminde_app/core/services/notification_service.dart'; // ✅ IMPORT جديد
import 'package:reminde_app/logic/cubit/theme_cubit.dart';
import 'package:reminde_app/models/reminder_model.dart';
import 'package:reminde_app/screens/splash_screen.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ إعداد التايم زون
  tz.initializeTimeZones();
  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));

  // ✅ تهيئة الإشعارات
  await NotificationService.initialize();

  // ✅ Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ReminderModelAdapter());
  await Hive.openBox<ReminderModel>('reminders');
  await Hive.openBox('settings');

  // ✅ بدء التطبيق
  runApp(BlocProvider(create: (_) => ThemeCubit(), child: const RemindMeApp()));
}

class RemindMeApp extends StatelessWidget {
  const RemindMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const SplashScreen(),
            );
          },
        );
      },
    );
  }
}
