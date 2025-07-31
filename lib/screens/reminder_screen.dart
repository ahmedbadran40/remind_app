import 'package:flutter/material.dart';
import 'package:reminder_app/widgets/category_tab_bar';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminders')),
      body: CategoryTabBar(
        selectedIndex: 0, // مؤقتًا لحد ما تربطه بالبلوك
        onTabSelected: (index) {
          // هنا هتحط Cubit أو Bloc logic بعدين
        },
      ),
    );
  }
}
