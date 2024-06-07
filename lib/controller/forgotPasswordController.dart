import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pankaj_fires/view/loginView.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController resetpassword = TextEditingController();

  @override
  Future<void> forgotpass() async {
    try {
      print('Attempting to send password reset email...');
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetpassword.text);
      Get.snackbar("Success",
          "Password reset link successfully sent to your registered email");
      resetpassword.clear();
      Get.to(() => logIn());
      print('Password reset email sent successfully.');
    } catch (e) {
      print('Failed to send password reset email: $e');
    }
  }

  @override
  void dispose() {
    resetpassword.dispose();
    super.dispose();
  }
}
