import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pankaj_fires/view/loginView.dart';

import '../controller/forgotPasswordController.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPasswordController controller = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller.resetpassword,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.forgotpass();
                  },
                  child: Text("Send link"),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => logIn());
                    },
                    child: Text('Remember Password ?'))
              ],
            )));
  }
}
