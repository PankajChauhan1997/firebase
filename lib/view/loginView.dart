import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pankaj_fires/view/signupView.dart';

import '../controller/loginController.dart';
import 'forgotPasswordView.dart';

class logIn extends StatelessWidget {
  loginController controller = Get.put(loginController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Sign-In"),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Image.network(
                        'https://i.pinimg.com/736x/18/11/f3/1811f344025539b7b4abb446eb6f910d.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lets sign you in!',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome back, \nyou've been missed!",
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Email',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.remove_red_eye),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          CircularProgressIndicator();
                          Get.to(ForgotPassword());
                        },
                        child: Text("Forgot Password")),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        CircularProgressIndicator();
                        controller.signIn();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text("Log in")),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            endIndent:
                                10, // Adjust the spacing between divider and text
                          ),
                        ),
                        Text(
                          "Or Log in with",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            indent:
                                10, // Adjust the spacing between divider and text
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: Colors.grey,
                            width: 2), // Optional: Add a border color and width
                        color: Colors.white,
                      ),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/googleImage.png',
                            width: 24.0, // Set the desired width
                            height: 24.0, // Set the desired height
                          ),
                          label: Text('Log in with Google')),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        CircularProgressIndicator();
                        Get.to(() => SignUp());
                      },
                      child: Text("Don't have an account?"))
                ],
              ),
            )));
  }
}
