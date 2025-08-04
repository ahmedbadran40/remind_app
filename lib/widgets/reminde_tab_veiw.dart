import 'package:flutter/material.dart';
import 'package:reminde_app/core/constants/app_lists.dart';
import 'package:reminde_app/widgets/card_list_view.dart';

class ReminderTabView extends StatelessWidget {
  final TabController controller;

  const ReminderTabView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      children: List.generate(
        categoryTabs.length,
        (index) => CardListView(selectedCategory: categoryTabs[index]),
      ),
    );
  }
}
