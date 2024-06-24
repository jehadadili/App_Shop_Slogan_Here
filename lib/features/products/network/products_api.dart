import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trind/features/products/model/products_model.dart';

Future<List<ProductsModel>> productsApi({String? name}) async {
  String url = "https://fakestoreapi.com/products/category/$name";
  final response = await http.get(
    Uri.parse(url),
  );
  List<ProductsModel> data = [];
  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    for (var element in body) {
      data.add(ProductsModel.fromJson(element));
    }
  }
  return data;
}
