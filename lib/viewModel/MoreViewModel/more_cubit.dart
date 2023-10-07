import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreInitial());
  bool selectedMode = false;

  void changeTheme(bool selected) {
    bool selectedMode= !selected;
     emit(ChangeThemeState(selectedMode));
  }
  void changeLanguage(bool selected) {
    bool selectedLang = !selected;
    emit(ChangeLanguageState(selectedLang));
  }



}

