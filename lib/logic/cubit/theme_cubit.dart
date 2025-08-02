import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDark: false)) {
    _loadTheme();
  }

  void toggleTheme() {
    final newTheme = !state.isDark;
    emit(ThemeState(isDark: newTheme));
    Hive.box('settings').put('isDark', newTheme);
  }

  void _loadTheme() {
    final savedTheme = Hive.box('settings').get('isDark', defaultValue: false);
    emit(ThemeState(isDark: savedTheme));
  }
}
