part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState({required this.theme});
  final ThemeData theme;

  @override
  List<Object> get props => [theme];
}

class ChangeThemeState extends ThemeState {
  const ChangeThemeState(ThemeData theme) : super(theme: theme);
}
