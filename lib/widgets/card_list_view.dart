import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reminde_app/core/constants/hive_boxes.dart';
import 'package:reminde_app/core/constants/theme/utils/reminder_utils.dart';
import 'package:reminde_app/models/reminder_model.dart';
import 'package:reminde_app/widgets/custom_no_reminde.dart';

import 'dismissible_reminder_card.dart';

class CardListView extends StatelessWidget {
  final String selectedCategory;

  const CardListView({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final reminderBox = Hive.box<ReminderModel>(HiveBoxes.reminders);

    return ValueListenableBuilder(
      valueListenable: reminderBox.listenable(),
      builder: (context, Box<ReminderModel> box, _) {
        final reminders = box.values.toList();
        final filtered = filterReminders(
          allReminders: reminders,
          selectedCategory: selectedCategory,
        );

        if (filtered.isEmpty) {
          return const Center(child: CustomNoReminder());
        }

        return ListView.builder(
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            return DismissibleReminderCard(reminder: filtered[index]);
          },
        );
      },
    );
  }
}
