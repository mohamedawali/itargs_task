class MoreViewModel {
  bool selected = false;
  void change(bool selected) {
    selected = !selected;
  }

  bool isDark() {
    return selected;
  }
}
