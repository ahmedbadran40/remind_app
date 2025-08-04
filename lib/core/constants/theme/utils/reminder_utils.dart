import 'package:reminde_app/models/reminder_model.dart';

List<ReminderModel> filterReminders({
  required List<ReminderModel> allReminders,
  required String selectedCategory,
}) {
  if (selectedCategory == 'All') {
    return allReminders;
  }
  return allReminders
      .where((reminder) => reminder.category == selectedCategory)
      .toList();
}
