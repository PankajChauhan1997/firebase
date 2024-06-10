import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pankaj_fires/view/homeView.dart';
import 'package:pankaj_fires/view/signupView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyD2Va87yXtvMcIs1u0NrtUh4T5S_M3DS84', //api key/currentkey
        appId:
            '1:851645174246:android:3582786b9e77c651304627', //mobilesdk_app_id
        messagingSenderId: '851645174246', //project_number
        projectId: 'fire-d2329'), //project_id
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SignUp());
  }
}
