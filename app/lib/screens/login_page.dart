import 'dart:developer';

import 'package:app/colors/colors.dart';
import 'package:app/widgets/custom_button.dart';
import 'package:app/widgets/custom_text.dart';
import 'package:app/widgets/input_text.dart';
import 'package:app/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginPage extends GetWidget<AuthViewModel> {
  final AuthViewModel authViewController = Get.find<AuthViewModel>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            right: 20,
            left: 20,
          ),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          color: Colors.black,
                          fontSize: 25,
                          text: "Welcome",
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => RegisterPage());
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InputText(
                    text: 'Email',
                    hint: 'test@hotmail.com',
                    onSave: (value) {
                      authViewController.email = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        log("ERROR");
                      }
                      return value!;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputText(
                    text: 'Password',
                    hint: '*******',
                    onSave: (value) {
                      authViewController.password = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        log("ERROR");
                      }
                      return value!;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    text: "Log in",
                    onPress: () {
                      _formKey.currentState?.save();

                      controller.signInWithEmailAndPassword();
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: "Sign in with google",
                    onPress: () async {
                      controller.googleSignInMethod();
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
