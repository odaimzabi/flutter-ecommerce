import 'package:app/controllers/auth_controller.dart';
import 'package:app/screens/home_page.dart';
import 'package:app/screens/login_page.dart';
import 'package:app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (GetBuilder<AuthViewModel>(
      builder: (controller) =>
          controller.user?.uid == null ? LoginPage() : MainScreen(),
    ));
  }
}
