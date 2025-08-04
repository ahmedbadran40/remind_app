import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_assets.dart';

class LogoWidget extends StatelessWidget {
  final double opacity;

  const LogoWidget({super.key, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 3000),
      child: Image.asset(kLogo, height: 160.h),
    );
  }
}
