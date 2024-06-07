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
        return;
      }
      UserCredential signIn = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);
      Get.snackbar("Success", "User signed in successfully");

      Get.to(() => HomePage());
    } on FirebaseAuthException catch (e) {
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
