import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_colors.dart';
import 'package:reminde_app/screens/reminder_screen.dart';
import 'package:reminde_app/widgets/custom_logo.dart';
import 'package:reminde_app/widgets/custom_title_splash_screen.dart';

class CustomSplashBody extends StatefulWidget {
  const CustomSplashBody({super.key});

  @override
  State<CustomSplashBody> createState() => _CustomSplashBodyState();
}

class _CustomSplashBodyState extends State<CustomSplashBody> {
  double _opacity = 0;
  double _offsetY = 100;

  @override
  void initState() {
    super.initState();

    // Start fade-in animation
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (!mounted) return;
      setState(() {
        _opacity = 1;
        _offsetY = 0;
      });
    });

    // Navigate to home screen after splash
    Future.delayed(const Duration(milliseconds: 5000), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ReminderScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(opacity: _opacity),
            SizedBox(height: 20.h),
            TitleWidget(offsetY: _offsetY, opacity: _opacity),
          ],
        ),
      ),
    );
  }
}
