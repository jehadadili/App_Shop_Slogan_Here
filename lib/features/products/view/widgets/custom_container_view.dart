import 'package:flutter/material.dart';
import 'package:trind/features/cart/view/cart_view.dart';
import 'package:trind/features/details/view/details_view.dart';
import 'package:trind/features/products/model/products_model.dart';

class CustomContainerView extends StatelessWidget {
  const CustomContainerView({super.key, required this.productsModel});
  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailsView(
            id: productsModel.id ?? 0,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffD4E4E6),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Image.network(
              productsModel.image ?? "",
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 22,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsModel.title ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      productsModel.description ?? "",
                      style: const TextStyle(
                        color: Color(0xff898989),
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${productsModel.price.toString()}",
                          style: const TextStyle(
                            color: Color(0xff898989),
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CartView(
                                id: productsModel.id,
                                // image: productsModel.image,
                                // text: productsModel.title,
                                // price: productsModel.price,
                              );
                            }));
                          },
                          icon: const Icon(
                            Icons.shopping_cart_checkout,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
