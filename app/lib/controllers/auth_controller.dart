import 'dart:developer';

import 'package:app/screens/home_page.dart';
import 'package:app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  static AuthViewModel to = Get.find();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email = "", password = "", name = "";

  late Rx<User?> _user;

  User? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user = Rxn<User>(_auth.currentUser);
    _user.bindStream(_auth.userChanges());
  }

  @override
  void onReady() {
    log(user.toString());
    ever(_user, initialScreen);
  }

  initialScreen(_user) {
    if (_user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential);
  }

  void createAccountWithEmailAndPassword() async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;
      user?.updateDisplayName(name);

      Get.snackbar(
        'Success',
        "Created account",
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      log(email + " " + password);
      Get.snackbar(
        'Error login account',
        e.message!,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      log(error.toString());
      Get.snackbar("Error", error.message!,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}
