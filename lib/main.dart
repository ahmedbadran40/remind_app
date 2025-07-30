import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reminder_app/screens/splash_screen.dart';

void main() async {
  runApp(RemindMeApp());
}

class RemindMeApp extends StatelessWidget {
  const RemindMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), //حجم الديزين
      minTextAdapt: true, //يخلي النص يتأقلم بذكاء مع أحجام الشاشات الصغيرة
      splitScreenMode: true, //يخلّي التطبيق يشتغل صح حتى في وضع انقسام الشاشة
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          themeMode: ThemeMode.system,
          home: child,
        );
      },
      child: SplashScreen(),
    );
  }
}
