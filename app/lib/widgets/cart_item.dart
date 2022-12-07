import 'package:app/screens/product_details.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home_page.dart';

class CartItem extends StatelessWidget {
  final ProductModel product;

  const CartItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7,
              )
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    product.thumbnail,
                  )),
            ),
            CustomText(
              text: product.title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: product.category,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "\$${product.price}",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
