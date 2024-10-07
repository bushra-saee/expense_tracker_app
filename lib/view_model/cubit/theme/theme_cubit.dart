import 'package:expense_tacker_app/view_model/cubit/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit get(context) => BlocProvider.of<ThemeCubit>(context);
  bool isDark = false;
  void changeThemeMode() {
    isDark = !isDark;
    emit(ChangeTheme(isDark: isDark));
  }
}
