class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String brand;
  final double rating;
  final int weight;
  final String thumbnail;
  final List<String> images;
  final List<Review> reviews;
  final Dimension dimension;
  final String warranty;
  final String shipping;
  final String status;

  factory Product.fromMap(Map<String, dynamic> map) {
    List<String> photos =
        map['images'] == null ? [] : List<String>.from(map['images']);

    List<dynamic> list = map['reviews'] ?? [];
    List<Review> reviews = list.map((r) => Review.fromMap(r)).toList();

    Dimension dimension = Dimension.fromMap(map['dimensions']);

    return Product(
        id: map['id'] ?? 0,
        title: map['title'] ?? "",
        description: map['description'] ?? "",
        brand: map['brand'] ?? "",
        thumbnail: map['thumbnail'] ?? "",
        price: map['price'] ?? 0.0,
        rating: map['rating'] == null
            ? 0.0
            : double.tryParse(map['rating'].toString()) ?? 0.0,
        weight: map['weight'] ?? 0,
        images: photos,
        reviews: reviews,
        dimension: dimension,
        warranty: map['warrantyInformation'] ?? "",
        shipping: map['shippingInformation'] ?? "",
        status: map['availabilityStatus'] ?? "");
  }

  const Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.brand,
      this.rating = 0,
      this.price = 0,
      this.weight = 0,
      required this.thumbnail,
      this.images = const [],
      this.reviews = const [],
      required this.dimension,
      required this.warranty,
      required this.shipping,
      required this.status});
}

class Dimension {
  final double length;
  final double width;
  final double height;

  factory Dimension.fromMap(Map<String, dynamic> map) {
    return Dimension(
        length: map['depth'] == null
            ? 0.0
            : double.tryParse(map['depth'].toString()) ?? 0.0,
        width: map['width'] == null
            ? 0.0
            : double.tryParse(map['width'].toString()) ?? 0.0,
        height: map['height'] == null
            ? 0.0
            : double.tryParse(map['height'].toString()) ?? 0.0);
  }

  Dimension({required this.length, required this.width, required this.height});
}

class Review {
  final double rating;
  final String reviewerName;
  final String reviewerEmail;
  final String comment;
  final DateTime date;

  String get getFirstLetter => reviewerName.substring(0, 1);

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      reviewerName: map['reviewerName'],
      comment: map['comment'],
      date: DateTime.parse(map['date']),
      rating: map['rating'] == null
          ? 0.0
          : double.tryParse(map['rating'].toString()) ?? 0.0,
      reviewerEmail: map['reviewerEmail'],
    );
  }

  Review({
    required this.reviewerName,
    required this.comment,
    required this.date,
    required this.rating,
    required this.reviewerEmail,
  });
}
