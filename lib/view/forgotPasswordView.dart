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
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Forgot Password'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.network(
                        'https://cdni.iconscout.com/illustration/premium/thumb/forgot-password-8291020-6632151.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 20,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Text('Forgot \nPassword?',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold)),
                        ),
                        subtitle: Text(
                            "Don't worry! It happens. please enter the address associated with your account."),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller.resetpassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Email',
                          suffixIcon: Icon(Icons.person),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.forgotpass();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text("Send link"),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => logIn());
                      },
                      child: Text('Remember Password ?'))
                ],
              ),
            )));
  }
}
