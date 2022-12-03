import 'package:app/screens/login_page.dart';
import 'package:app/screens/product_details.dart';
import 'package:app/screens/register_page.dart';
import 'package:app/bindings/root_binding.dart';
import 'package:app/bindings/home_binding.dart';
import 'package:app/screens/root.dart';
import 'package:get/get.dart';

import '../screens/home_page.dart';

appRoutes() => [
      GetPage(
        name: '/root',
        page: () => Root(),
        binding: RootBinding(),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
      ),
      GetPage(
        name: '/register',
        page: () => RegisterPage(),
      ),
      GetPage(
        name: '/home',
        page: () => HomePage(),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
