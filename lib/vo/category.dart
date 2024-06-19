class Category {
  final String id;
  final String name;
  
  String? imageUrl;

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['slug'],
      name: map['name'],
    );
  }

  Category({required this.id, required this.name, this.imageUrl});
}
