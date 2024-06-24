import 'package:flutter/material.dart';
import 'package:trind/features/cart/model/cart_model.dart';

class CustomDesignCart extends StatelessWidget {
  const CustomDesignCart(
      {super.key,
      required this.cartModel,
      required this.image,
      required this.text,
      required this.price});
  final CartModel cartModel;

  final String image;
  final String text;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffD4E4E6),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Image.network(
              image,
              width: 150,
              height: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$$price',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.green,
                        ),
                        Text(
                          "5",
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
