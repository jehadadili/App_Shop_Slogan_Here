import 'package:trind/features/details/model/rating.dart';

class DetailsModel {
  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  DetailsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
  factory DetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return DetailsModel(
      id: int.tryParse(jsonData["id"].toString()),
      title: jsonData["title"],
      price: int.tryParse(jsonData["price"].toString()),
      description: jsonData["description"],
      category: jsonData["category"],
      image: jsonData["image"],
      rating: Rating.fromJson(jsonData['rating']),
    );
  }
}
