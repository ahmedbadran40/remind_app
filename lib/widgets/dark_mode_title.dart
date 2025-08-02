import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder_app/logic/cubit/theme_cubit.dart';

class DarkModeTile extends StatelessWidget {
  const DarkModeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ListTile(
          tileColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Dark Mode',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          trailing: Switch(
            value: state.isDark,
            onChanged: (_) {
              BlocProvider.of<ThemeCubit>(context).toggleTheme();
            },
          ),
        );
      },
    );
  }
}
