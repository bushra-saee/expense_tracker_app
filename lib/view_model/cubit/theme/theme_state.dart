abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ChangeTheme extends ThemeState {
  final bool isDark;
  ChangeTheme({required this.isDark});
}
