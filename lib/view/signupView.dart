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
          title: Text('Welcome to Sign-up'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Sign up',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(child: Image.asset('assets/googleImage.png')),
                    CircleAvatar(child: Image.asset('assets/facebook.png')),
                    CircleAvatar(child: Image.asset('assets/tweeter.png')),
                    CircleAvatar(child: Image.asset('assets/insta.png')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Text(' or via an Email '),
                    Expanded(
                        child: Divider(
                      thickness: 2,
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.idController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Email',
                      suffixIcon: Icon(Icons.person),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.passController,
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
              TextButton(
                onPressed: () {
                  Get.to(logIn());
                },
                child: Text('Already have an acount?'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    controller.Signup();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text("Sign up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
