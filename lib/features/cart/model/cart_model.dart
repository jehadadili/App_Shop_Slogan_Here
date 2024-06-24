import 'package:trind/features/cart/model/cart_item.dart';

class CartModel {
  int id;
  int userId;
  DateTime date;
  List<CartItem> products;

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: (json['products'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
    );
  }
}
