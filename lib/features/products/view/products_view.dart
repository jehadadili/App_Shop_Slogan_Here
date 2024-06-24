import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trind/features/products/view_model/cubit.dart';
import 'package:trind/features/products/view/widgets/custom_container_view.dart';

import '../../cart/view/cart_view.dart';
import '../view_model/state.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProductcubit(category: category),
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            category,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(size: 30),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CartView();
                  }));
                },
                icon: const Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: Colors.green,
                  size: 30,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductSucsses) {
                return SizedBox(
                  height: 1000,
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: context.read<ProductCubit>().data.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .7,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 30),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: CustomContainerView(
                            productsModel:
                                context.read<ProductCubit>().data[index],
                          ),
                        );
                      }),
                );
              } else {
                return const Center(child: Text('Failed to load products'));
              }
            },
          ),
        ),
      ),
    );
  }
}
