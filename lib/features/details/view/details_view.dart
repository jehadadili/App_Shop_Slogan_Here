import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trind/features/details/view/widgets/custom_design_details.dart';
import 'package:trind/features/details/view_model/cubit.dart';
import 'package:trind/features/details/view_model/state.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit()..getDetailsCubit(id: id),
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Details",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(size: 30),
        ),
        body: BlocConsumer<DetailsCubit, DetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is DetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DetailsSucsses) {
              final product = context.read<DetailsCubit>().product;
              if (product != null) {
                return CustomDesignDetails(detailsModel: product);
              } else {
                return const Center(
                    child: Text('No product details available.'));
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
