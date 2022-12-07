import 'package:app/controllers/cart_controller.dart';
import 'package:app/widgets/cart_item.dart';
import 'package:app/models/product_model.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsGrid extends StatelessWidget {
  RxList<ProductModel> items;
  int price;
  ItemsGrid({required this.items, required this.price});
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: CustomText(
                  fontSize: 20,
                  text: "Total price: \$${price}",
                ),
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: .63,
                padding: const EdgeInsets.all(10),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 10,
                children: items.map((ProductModel product) {
                  return CartItem(
                    product: product,
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: CustomButton(
                  onPress: () {
                    cartController.checkout();
                  },
                  text: "Checkout",
                ),
              )
            ],
          ),
        ));
  }
}
