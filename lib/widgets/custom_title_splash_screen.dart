import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_colors.dart';
import 'package:reminde_app/core/constants/app_strings.dart';

class TitleWidget extends StatelessWidget {
  final double offsetY;
  final double opacity;

  const TitleWidget({super.key, required this.offsetY, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 3000),
      opacity: opacity,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 3000),
        transform: Matrix4.translationValues(0, offsetY, 0),
        curve: Curves.easeInOut,
        child: Transform.translate(
          offset: Offset(0, -50.h),
          child: Text(
            AppStrings.appTitleSplashScreen,
            style: TextStyle(
              color: kColorApp,
              fontSize: 35.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
