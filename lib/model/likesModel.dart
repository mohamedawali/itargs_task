class ListItem {
  final String title;
  bool isLiked;

  ListItem(this.title, this.isLiked);
}

class HomeModel {
  final List<ListItem> items;

  HomeModel(this.items);
}
