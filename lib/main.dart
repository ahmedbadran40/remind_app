import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reminder_app/screens/splash_screen.dart';

void main() {
  runApp(const RemindMeApp());
}

class RemindMeApp extends StatelessWidget {
  const RemindMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const SplashScreen(),
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
    );
  }
}
