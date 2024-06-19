class Item {
  final int id;
  final String title;
  final String description;
  final double price;
  final dynamic rating;
  final int weight;
  final String thumbnail;

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map['id'] ?? 0,
        title: map['title'] ?? "",
        description: map['description'] ?? "",
        thumbnail: map['thumbnail'] ?? "",
        price: map['price'] ?? 0.0,
        rating: map['rating'] == null
            ? 0.0
            : double.tryParse(map['rating'].toString()) ?? 0.0,
        weight: map['weight'] ?? 0);
  }

  Item(
      {required this.id,
      required this.title,
      required this.description,
      this.rating = 0,
      this.price = 0,
      this.weight = 0,
      required this.thumbnail});
}
