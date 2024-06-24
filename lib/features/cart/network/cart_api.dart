import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trind/features/cart/model/cart_model.dart';

Future<CartModel> cartApi({required int id}) async {
  String url = "https://fakestoreapi.com/carts/$id";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return CartModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load product');
  }
}
