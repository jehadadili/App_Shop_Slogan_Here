import 'package:flutter/material.dart';
import 'package:trind/features/home/view/widgets/custom_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/shop.png"),
            const CustomListView()
          ],
        ),
      ),
    );
  }
}
