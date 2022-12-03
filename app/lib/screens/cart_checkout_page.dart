import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/cart_controller.dart';
import 'package:app/controllers/product_controller.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/products_grid.dart';
import '../controllers/product_controller.dart';

class CartCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => Obx(() => Scaffold(
          body: controller.items.length == 0
              ? Center(
                  child: CustomText(
                    text: "No items added",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Text(controller.items.length.toString()))),
    );
  }
}
