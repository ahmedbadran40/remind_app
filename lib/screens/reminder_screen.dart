import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminde_app/core/constants/app_lists.dart';
import 'package:reminde_app/core/constants/app_strings.dart';
import 'package:reminde_app/widgets/custom_app_bar.dart';
import 'package:reminde_app/widgets/reminde_tab_veiw.dart';
import 'package:reminde_app/widgets/reminder_fab.dart';
import 'package:reminde_app/widgets/reminder_tap_bar.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: categoryTabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: const ReminderFAB(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(title: AppStrings.remindersTitle),
              SizedBox(height: 20.h),
              ReminderTabBar(controller: tabController),
              SizedBox(height: 20.h),
              Expanded(child: ReminderTabView(controller: tabController)),
            ],
          ),
        ),
      ),
    );
  }
}
