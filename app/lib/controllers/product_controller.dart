import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductController extends GetxController {
  RxList<ProductModel> products = RxList<ProductModel>();
  final RxBool isLoading = false.obs;

  get getProducts => products;

  get loading => isLoading.value;

  @override
  void onInit() async {
    super.onInit();
    await fetchProducts();
  }

  fetchProducts() async {
    isLoading(true);
    try {
      http.Response response =
          await http.get(Uri.parse("https://dummyjson.com/products?limit=6"));
      var result = jsonDecode(response.body);
      var productsResult = result["products"];
      for (final product in productsResult) {
        products.add(ProductModel.fromJson(product));
      }
      isLoading(false);
    } catch (e) {
      print(e);
    }
  }
}
