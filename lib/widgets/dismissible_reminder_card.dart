import 'package:flutter/material.dart';
import 'package:reminde_app/core/constants/app_strings.dart';
import 'package:reminde_app/models/reminder_model.dart';
import 'package:reminde_app/widgets/reminde_card_item.dart';

class DismissibleReminderCard extends StatelessWidget {
  final ReminderModel reminder;

  const DismissibleReminderCard({super.key, required this.reminder});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(reminder.key.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) async {
        final messenger = ScaffoldMessenger.of(context);
        await reminder.delete();

        messenger.showSnackBar(
          const SnackBar(content: Text(AppStrings.reminderDeleted)),
        );
      },
      child: ReminderCard(reminder: reminder),
    );
  }
}
