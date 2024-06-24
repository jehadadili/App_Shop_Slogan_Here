import 'package:bloc/bloc.dart';
import 'package:trind/features/cart/model/cart_model.dart';
import 'package:trind/features/cart/network/cart_api.dart';
import 'package:trind/features/cart/view_model/state.dart';

class CartCubit extends Cubit<CartState> {
  CartModel? product;
  CartCubit() : super(CartInitial());

  getCartCubit({required int id}) async {
    emit(CartLoading());

    product = await cartApi(id: id);
    if (product != null) {
      emit(CartSuccess());
    }
  }
}
