class Recette{
  int id;
  String title;
  String user;
  String imageUrl;
  String description;
  bool isFavorite;
  int favoriteCount;
  double price;

  Recette(this.id, this.title, this.user, this.imageUrl, this.description, this.isFavorite, this.favoriteCount, this.price);
}