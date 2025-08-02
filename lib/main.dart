import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reminder_app/logic/cubit/theme_cubit.dart';
import 'package:reminder_app/models/reminder_model.dart';
import 'package:reminder_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ReminderModelAdapter());
  await Hive.openBox<ReminderModel>('reminders');
  await Hive.openBox('settings');

  runApp(
    BlocProvider(create: (context) => ThemeCubit(), child: const RemindMeApp()),
  );
}

class RemindMeApp extends StatelessWidget {
  const RemindMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: Color(0xFFFFF7EC),
                cardColor: Color(0xFFF9EEDC),
                textTheme: GoogleFonts.poppinsTextTheme(),
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Color(0xFF121212),
                cardColor: Color(0xFF1E1E1E),
                textTheme: GoogleFonts.poppinsTextTheme(
                  ThemeData.dark().textTheme,
                ),
              ),
              themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const SplashScreen(),
            );
          },
        );
      },
    );
  }
}
