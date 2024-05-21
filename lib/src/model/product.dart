class Product {
  String title;
  String description;
  double price;
  int quantity;
  double score;
  List<String> images;
  bool isFavorite;
  String category;

  Product({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    required this.score,
    required this.images,
    this.isFavorite = false,
    required this.category,
  });
}
