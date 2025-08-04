import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_lists.dart';

class ReminderTabBar extends StatelessWidget {
  final TabController controller;

  const ReminderTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      indicatorColor: Colors.orange,
      labelColor: Colors.brown,
      unselectedLabelColor: Colors.grey,
      //labelPadding: EdgeInsets.only(right: 16.w, left: 16.w),
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      tabs: List.generate(
        categoryTabs.length,
        (index) => Tab(text: categoryTabs[index]),
      ),
    );
  }
}
