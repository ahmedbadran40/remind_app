import 'package:flutter/material.dart';
import 'package:reminder_app/widgets/reminde_card_item.dart';

class CardListView extends StatelessWidget {
  CardListView({super.key});
  final List<Map<String, String>> reminderList = [
    {'title': 'Drink water', 'time': '1:00 PM'},
    {'title': 'Call your mom', 'time': '5:00 AM'},
    {'title': 'Take a deep breath', 'time': '9:00 PM'},
    {'title': 'Pray', 'time': '3:00 PM'},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return ReminderCard(
          title: reminderList[index]['title']!,
          time: reminderList[index]['time']!,
        );
      },
    );
  }
}
