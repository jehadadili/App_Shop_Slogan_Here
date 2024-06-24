import 'package:flutter/material.dart';
import 'package:trind/features/home/view/home_view.dart';

void main() async {
  runApp(const AppShopSloganHere());
}

class AppShopSloganHere extends StatelessWidget {
  const AppShopSloganHere({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
