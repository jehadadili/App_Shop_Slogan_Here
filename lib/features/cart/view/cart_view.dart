import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trind/features/cart/view/widgets/custom_dseign_cart.dart';
import 'package:trind/features/cart/view_model/cubit.dart';
import 'package:trind/features/cart/view_model/state.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, this.id, this.image, this.text, this.price});
  final int? id;
  final String? image;
  final String? text;
  final int? price;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartCubit(id: id ?? 0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartSuccess) {
              final product = context.read<CartCubit>().product;
              if (product != null) {
                return CustomDesignCart(
                    cartModel: product,
                    image: image ?? "",
                    text: text ?? "",
                    price: price ?? 0);
              } else {
                return const Center(child: Text('No product Cart available.'));
              }
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
