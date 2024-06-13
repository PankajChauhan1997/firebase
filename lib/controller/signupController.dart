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
    checkAuthState();
  }

  checkAuthState() async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          if (user.emailVerified) {
            Get.to(() => HomePage());
          } else {
            Get.snackbar(
              "Verification Required",
              "Please verify your email to continue.",
              colorText: Colors.white,
              backgroundColor: Colors.red,
            );
            Get.to(() => logIn());
          }
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
        Get.snackbar("Failed", "Please enter both Email and Password",
            colorText: Colors.white, backgroundColor: Colors.red);
        return;
      }
      UserCredential signup = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: idController.text, password: passController.text);
      User? user = signup.user;
      if (user != null) {
        user.sendEmailVerification();
        Get.snackbar(
          "Success",
          "Please verify your account. Verification email has been sent.",
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        idController.clear();
        passController.clear();
        Get.to(() => logIn());
      }
      // else {
      //   user?.sendEmailVerification();
      //   Get.snackbar(
      //       "Success", "Please verify account,Verification email has been sent",
      //       colorText: Colors.white, backgroundColor: Colors.green);
      //   Get.to(() => logIn());
      //   idController.clear();
      //   passController.clear();
      // }
    } catch (e) {
      print("Error occured while signup  ${e}");
      Get.snackbar(
          "Failed", "Please try another email address this is already taken",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  @override
  void dispose() {
    idController.dispose();
    passController.dispose();
    super.dispose();
  }
}
