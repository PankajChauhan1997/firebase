import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pankaj_fires/view/signupView.dart';

import '../controller/loginController.dart';

class logIn extends StatelessWidget {
  loginController controller = Get.put(loginController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter"),
            ),
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome Back!',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                        controller: controller.email,
                        decoration: InputDecoration(
                            hintText: 'Email', prefixIcon: Icon(Icons.person))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller.password,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password)),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.signIn();
                      },
                      child: Text("Sign in")),
                  TextButton(
                      onPressed: () {
                        Get.to(() => SignUp());
                      },
                      child: Text("Don't have an account? SignUp here..."))
                ],
              ),
            )));
  }
}
