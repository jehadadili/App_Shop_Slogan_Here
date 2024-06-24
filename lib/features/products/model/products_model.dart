class ProductsModel {
  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final String? category;
  final String? image;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductsModel(
      id: int.tryParse(jsonData["id"].toString()),
      title: jsonData["title"],
      price: int.tryParse(jsonData["price"].toString()),
      description: jsonData["description"],
      category: jsonData["category"],
      image: jsonData["image"],
    );
  }
}
