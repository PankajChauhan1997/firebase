import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pankaj_fires/controller/signupController.dart';

import 'forgotPasswordView.dart';
import 'loginView.dart';

class SignUp extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter"),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.idController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.passController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password),
                  ),
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.Signup();
                },
                child: Text("Sign up"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(logIn());
                    },
                    child: Text('Sign in'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(ForgotPassword());
                    },
                    child: Text('Forgot password'),
                  ),
                ],
              ),
            ],
          )
          // Obx(
          //   () => controller.pk.value == false
          //       ? SignUpForm(controller: controller)
          //       : SignInForm(controller: controller),
          // ),
          ),
    );
  }
}

// class SignInForm extends StatelessWidget {
//   final SignupController controller;
//
//   SignInForm({required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
