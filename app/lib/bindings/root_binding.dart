import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/cart_controller.dart';
import 'package:app/controllers/product_controller.dart';
import 'package:get/get.dart';

import '../screens/main_screen.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthViewModel>(AuthViewModel(), permanent: true);
    Get.put<ControlViewModel>(ControlViewModel(), permanent: true);
    Get.put<ProductController>(ProductController(), permanent: true);
    Get.put<CartController>(CartController(), permanent: true);
  }
}
