part of 'more_cubit.dart';

@immutable
abstract class MoreState {}

class MoreInitial extends MoreState {}

class ChangeThemeState extends MoreState {
  final  bool selected ;
  ChangeThemeState(this.selected);
}
class ChangeLanguageState extends MoreState {
  final  bool selected ;
  ChangeLanguageState(this.selected);
}