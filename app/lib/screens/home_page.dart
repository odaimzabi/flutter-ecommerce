import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/products_grid.dart';
import '../controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) => Obx(
        () => controller.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ProductsGrid(
                products: controller.products,
              ),
      ),
    );
  }
}
