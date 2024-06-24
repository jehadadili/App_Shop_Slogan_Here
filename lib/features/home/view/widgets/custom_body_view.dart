import 'package:flutter/material.dart';
import 'package:trind/features/home/model/home_model.dart';
import 'package:trind/features/products/view/products_view.dart';

class CustomBodyView extends StatelessWidget {
  const CustomBodyView({super.key, required this.homeModel});
  final HomeModel homeModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 356,
          height: 88,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color(0xffD4E4E6),
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProductsView(category: homeModel.text);
                }));
              },
              child: Text(
                homeModel.text,
                style: const TextStyle(
                    color: Color(0xff5F5F5F),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
