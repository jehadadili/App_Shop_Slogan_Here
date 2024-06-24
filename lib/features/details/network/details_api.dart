import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trind/features/details/model/details_model.dart';

Future<DetailsModel> detailsApi({required int id}) async {
  String url = "https://fakestoreapi.com/products/$id";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return DetailsModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load product');
  }
}
