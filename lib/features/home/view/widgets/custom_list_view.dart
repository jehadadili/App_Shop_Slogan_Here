import 'package:flutter/material.dart';
import 'package:trind/features/home/view/widgets/custom_body_view.dart';

import '../../model/home_model.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<HomeModel> itemlist = [
    HomeModel(text: "electronics"),
    HomeModel(text: "jewelery"),
    HomeModel(text: "men's clothing"),
    HomeModel(text: "women's clothing"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: itemlist.length,
        itemBuilder: (context, index) {
          return CustomBodyView(
            homeModel: itemlist[index],
          );
        },
      ),
    );
  }
}
