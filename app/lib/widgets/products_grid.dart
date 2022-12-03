import 'package:app/widgets/product_card.dart';
import 'package:app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsGrid extends StatelessWidget {
  RxList<ProductModel> products;
  ProductsGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: products.map((ProductModel product) {
          return ProductCard(
            product: product,
          );
        }).toList(),
      ),
    );
  }
}
