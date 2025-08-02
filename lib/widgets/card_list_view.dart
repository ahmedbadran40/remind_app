import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reminder_app/models/reminder_model.dart';
import 'package:reminder_app/widgets/custom_no_reminde.dart';
import 'package:reminder_app/widgets/dismissible_reminder_card.dart';

class CardListView extends StatelessWidget {
  final String selectedCategory;

  const CardListView({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final reminderBox = Hive.box<ReminderModel>('reminders');

    return ValueListenableBuilder(
      valueListenable: reminderBox.listenable(),
      builder: (context, Box<ReminderModel> box, _) {
        final reminders = box.values.toList();

        final filtered = selectedCategory == 'All'
            ? reminders
            : reminders.where((r) => r.category == selectedCategory).toList();

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
