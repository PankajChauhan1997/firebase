import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pankaj_fires/view/loginView.dart';

import '../view/homeView.dart';

class SignupController extends GetxController {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  checkAuthState() async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          Get.to(() => HomePage());
        } else {
          Get.to(() => logIn());
        }
      });
    } catch (e) {
      print("Error occured while signup  ${e}");
    }
  }

  Future<void> Signup() async {
    try {
      if (idController.text.isEmpty || passController.text.isEmpty) {
        print("Email and Password can not be null");
        return;
      }
      UserCredential signup = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: idController.text, password: passController.text);
      User? user = signup.user;
      if (user != null && user.emailVerified) {
        Get.snackbar("Success", "Please login with your email and password",
            snackPosition: SnackPosition.BOTTOM);
        checkAuthState();
        Get.to(() => logIn());
      } else {
        user?.sendEmailVerification();
        Get.snackbar("Success signed up",
            "Please verify account,Verification email has been sent",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error occured while signup  ${e}");
    }
  }

  @override
  void dispose() {
    idController.dispose();
    passController.dispose();
    super.dispose();
  }
}
