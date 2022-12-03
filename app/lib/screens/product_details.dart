import 'package:app/controllers/cart_controller.dart';
import 'package:app/models/product_model.dart';
import 'package:app/screens/main_screen.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductModel product;
  ProductDetailsPage({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.offAll(MainScreen());
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                shadowColor: Colors.black,
                elevation: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.network(
                    product.thumbnail,
                  ),
                ),
              ),
              CustomText(
                fontSize: 20,
                text: product.title,
                fontWeight: FontWeight.w500,
                height: 4,
              ),
              CustomText(
                fontSize: 16,
                text: "\$${product.price}",
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              CustomText(
                fontSize: 16,
                text: product.description,
                fontWeight: FontWeight.w500,
                height: 2,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  enableFeedback: true,
                  minimumSize: Size(100, 45),
                ),
                onPressed: () {
                  CartController.cart.addItem(product);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_checkout),
                    Text("Add to cart"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
