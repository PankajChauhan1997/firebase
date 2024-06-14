import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pankaj_fires/view/signupView.dart';

import '../view/homeView.dart';

class HomeController extends GetxController {
  final TextEditingController dateController = TextEditingController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(SignUp());
  }

  void selectDate(DateTime date) {
    dateController.text = DateFormat('MMMM dd yyyy').format(date);
    selectedDate.value = date;
  }

  String getDayOfWeek(DateTime date) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[date.weekday - 1];
  }

  var dropdownValue = 'Timeline'.obs;

  void updateValue(String newValue) {
    dropdownValue.value = newValue;
  }

  int getLastDayOfMonth() {
    DateTime now = DateTime.now();
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    return lastDayOfMonth.day;
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading version'));
        } else {
          final packageInfo = snapshot.data;
          final version = packageInfo?.version ?? 'Unknown version';
          return Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/pocket_hrms_main_logo.png'))),
                        child: Text(''),
                      ),
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Profile'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Version: $version'),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
