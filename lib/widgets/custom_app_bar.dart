import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminder_app/constance.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
        color: kColorApp,
      ),
    );
  }
}
