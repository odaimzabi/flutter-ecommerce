class ProductModel {
  String title, thumbnail, category, description;
  int id, price;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.thumbnail,
    required this.category,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
        id: map["id"],
        price: map["price"],
        title: map["title"],
        category: map["category"],
        thumbnail: map["thumbnail"],
        description: map["description"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'title': title,
      'category': category,
      'thumbnail': thumbnail,
      "description": description
    };
  }
}
