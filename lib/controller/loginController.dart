import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pankaj_fires/view/homeView.dart';

class loginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> signIn() async {
    try {
      if (email.text.isEmpty || password.text.isEmpty) {
        print("Please enter both the fields");
        Get.snackbar("Failed", "Please enter both the fields",
            colorText: Colors.white, backgroundColor: Colors.red);
        return;
      }
      UserCredential login = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);
      // Get.snackbar("Success", "User signed in successfully",
      //     colorText: Colors.white, backgroundColor: Colors.green);
      // Get.to(() => HomePage());

      User? user = login.user;
      if (user != null && user.emailVerified) {
        Get.snackbar("Success", "User signed in successfully",
            colorText: Colors.white, backgroundColor: Colors.green);
        Get.to(() => HomePage());
        email.clear();
        password.clear();
      } else {
        Get.snackbar(
          "Verification Required",
          "Please verify your email to continue.",
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Failed", "$e",
          colorText: Colors.white, backgroundColor: Colors.red);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print("Error occurred during sign in: ${e.message}");
      }
    } catch (e) {
      print("An unexpected error occurred: ${e}");
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
