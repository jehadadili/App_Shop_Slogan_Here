import 'package:bloc/bloc.dart';
import 'package:trind/features/products/model/products_model.dart';
import 'package:trind/features/products/network/products_api.dart';
import 'package:trind/features/products/view_model/state.dart';

class ProductCubit extends Cubit<ProductState> {
  List<ProductsModel> data = [];
  ProductCubit() : super(ProductInitial());

  getProductcubit({required String category}) async {
    emit(ProductLoading());
    data = await productsApi(name: category);
    emit(ProductSucsses());
  }
}
