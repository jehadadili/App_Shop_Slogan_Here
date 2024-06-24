import 'package:flutter/material.dart';
import 'package:trind/features/cart/view/cart_view.dart';
import 'package:trind/features/details/model/details_model.dart';

class CustomDesignDetails extends StatelessWidget {
  const CustomDesignDetails({super.key, required this.detailsModel});
  final DetailsModel detailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Image.network(
              detailsModel.image ?? "",
              width: 300,
              height: 200,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            detailsModel.title ?? "",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${detailsModel.price}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          Text(detailsModel.description ?? ""),
          const SizedBox(height: 8),
          Text(
            'Category: ${detailsModel.category}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow),
              const SizedBox(width: 4),
              Text(
                  '${detailsModel.rating?.rate} (${detailsModel.rating?.count} reviews)'),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: 353,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: const Color(0xffD4E4E6),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CartView(
                        id: detailsModel.id ?? 0,
                      );
                    }));
                  },
                  child: const Text(
                    "Add Cart",
                    style: TextStyle(
                        color: Color(0xff5F5F5F),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
