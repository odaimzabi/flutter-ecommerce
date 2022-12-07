import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/cart_controller.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:app/widgets/items_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => Obx(
        () => Scaffold(
            body: controller.items.length == 0
                ? const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: CustomText(
                        text: "No items added",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : ItemsGrid(items: controller.items, price: controller.price)),
      ),
    );
  }
}
