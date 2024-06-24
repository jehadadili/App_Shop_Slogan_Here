import 'package:bloc/bloc.dart';
import 'package:trind/features/details/model/details_model.dart';
import 'package:trind/features/details/network/details_api.dart';
import 'package:trind/features/details/view_model/state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsModel? product;
  DetailsCubit() : super(DetailsInitial());

  getDetailsCubit({required int id}) async {
    emit(DetailsLoading());

    product = await detailsApi(id: id);
    if (product != null) {
      emit(DetailsSucsses());
    }
  }
}
