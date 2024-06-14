import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pankaj_fires/controller/profileController.dart';
import 'package:pankaj_fires/view/homeView.dart';

import '../controller/bottomNavigationbar.dart';

class ProfilePage extends StatelessWidget {
  profileController controller = Get.put(profileController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: BottomNavigationService.buildBottomNavigation(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white, size: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.black12,
                        ),
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 60.0, bottom: 20),
                              child: CircleAvatar(
                                child: Text("P"),
                                radius: 50,
                              ),
                            ),
                            ListTile(
                              title: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Pankaj Chauhan",
                                  style: TextStyle(
                                      color: Colors.white, // Title text color
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20 // Optional: make title bold
                                      ),
                                ),
                              ),
                              subtitle: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'chauhanpankajchabiraj@gmail.com',
                                  style: TextStyle(
                                    color: Colors.white,
                                    // Subtitle text color
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -0,
                      left: 50,
                      right: 50,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => HomePage());
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue, // Color of the bottom container
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // Ensures the Row takes minimum horizontal space
                            children: [
                              SizedBox(width: 20),
                              Icon(Icons.arrow_back,
                                  color: Colors.white, size: 20),
                              SizedBox(width: 50),
                              Text(
                                'Back to Home',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Account Info",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        "Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Pankaj Chauhan'),
                    ),
                    ListTile(
                      leading: Icon(Icons.mobile_friendly),
                      title: Text(
                        "Mobile",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('9370410988'),
                    ),
                    ListTile(
                      leading: Icon(Icons.email_outlined),
                      title: Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('chauhanpankajcahbiraj@gmail.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text(
                        "D.O.B",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('8 April 1997'),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on_outlined),
                      title: Text(
                        "Address",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Ulhasnagar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
