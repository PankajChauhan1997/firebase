import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pankaj_fires/view/locationView.dart';
import 'package:pankaj_fires/view/profileView.dart';
import '../controller/bottomNavigationbar.dart';
import '../controller/customerDataController.dart';
import '../controller/homeController.dart';
import 'customerDataView.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu, color: Colors.blue),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              },
            ),
            actions: [
              // InkWell(
              //   onTap: () {
              //     Get.to(LocationPage());
              //   },
              //   child: Icon(
              //     Icons.location_on_outlined,
              //     color: Colors.blue,
              //   ),
              // ),
              SizedBox(width: 10),
              InkWell(
                child: SvgPicture.asset(
                  'assets/≡ƒôìTrailing icon 1.svg',
                  width: 40,
                  height: 40,
                ),
                onTap: () {
                  Get.to(customerData());
                },
              ),
              SizedBox(width: 10),
              Flexible(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: Text('Logout'),
                                onTap: () {
                                  controller.signOut();
                                },
                              ),
                              ListTile(
                                title: Text('Profile'),
                                onTap: () {
                                  Navigator.pop(context); // Close the dialog
                                  // Add profile navigation functionality here
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey,
                    child: Text(
                      "P",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width:
                      10), // Added this to provide spacing after the last action
            ],
          ),
          drawer: AppDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      "Welcome, Pocket !!",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text("here is your dashboard..."),
                    trailing: SvgPicture.asset(
                      'assets/Group 922.svg',
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    child: IntrinsicWidth(
                      child: Row(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 20,
                            color: Color(0xFF33A1CC),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: CircleAvatar(
                                          radius: 70,
                                          child: SvgPicture.asset(
                                            'assets/orders-illustration-image.svg',
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all(const Color(
                                                  0xFFFE804E)), // Updated color format
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Orders",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: <Widget>[
                                          Card(
                                            color: Color(0xFFFE804E),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  8), // Circular border with radius 8
                                            ),
                                            elevation: 20,
                                            child: Container(
                                              height: 100.0,
                                              width: 150.0,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          14.0, // Default font size for other text
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: "You have ",
                                                      ),
                                                      TextSpan(
                                                        text: "3",
                                                        style: TextStyle(
                                                          fontSize:
                                                              20.0, // Increased font size for "3"
                                                          fontWeight: FontWeight
                                                              .bold, // Optional: make it bold
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            " active orders from",
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Align(
                                            alignment: FractionalOffset(0.5,
                                                1.0), // Align at the bottom center
                                            child: FractionalTranslation(
                                              translation: Offset(1.3,
                                                  1.5), // Adjust position further if needed
                                              child: CircleAvatar(
                                                radius: 25.0,
                                                child: Text("A"),
                                              ),
                                            ),
                                          ),
                                          const Align(
                                            alignment: FractionalOffset(0.5,
                                                1.0), // Align at the bottom center
                                            child: FractionalTranslation(
                                              translation: Offset(0.7,
                                                  1.5), // Adjust position further if needed
                                              child: CircleAvatar(
                                                radius: 25.0,
                                                child: Text("B"),
                                              ),
                                            ),
                                          ),
                                          const Align(
                                            alignment: FractionalOffset(0.5,
                                                1.0), // Align at the bottom center
                                            child: FractionalTranslation(
                                              translation: Offset(0.10,
                                                  1.5), // Adjust position further if needed
                                              child: CircleAvatar(
                                                radius: 25.0,
                                                child: Text("C"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50.0, top: 8, bottom: 8),
                                      child: Stack(
                                        children: <Widget>[
                                          Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  8), // Circular border with radius 8
                                            ),
                                            elevation: 20,
                                            child: Container(
                                              height: 80.0,
                                              width: 120.0,
                                              child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                        text: "02",
                                                        style: TextStyle(
                                                            fontSize:
                                                                15.0, // Increased font size for "3"
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .blueAccent),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            " pending \n Orders from",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ]),
                                                  )),
                                            ),
                                          ),
                                          const Align(
                                            alignment: FractionalOffset(0.5,
                                                1.0), // Align at the bottom center
                                            child: FractionalTranslation(
                                              translation: Offset(0.8,
                                                  1.0), // Adjust position further if needed
                                              child: CircleAvatar(
                                                radius: 25.0,
                                                child: Text("A"),
                                              ),
                                            ),
                                          ),
                                          const Align(
                                            alignment: FractionalOffset(0.5,
                                                1.0), // Align at the bottom center
                                            child: FractionalTranslation(
                                              translation: Offset(0.2,
                                                  1.0), // Adjust position further if needed
                                              child: CircleAvatar(
                                                radius: 25.0,
                                                child: Text("B"),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ), //card 2...........................................
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 20,
                            color: Color(0xFFDCB223),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: CircleAvatar(
                                        radius: 60,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset(
                                            'assets/subscriptions-illustration-image.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xFF234DDC))),
                                        onPressed: () {},
                                        child: Text(
                                          "Subscriptions",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Card(
                                          color: Color(0xFF234DDC),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8), // Circular border with radius 8
                                          ),
                                          elevation: 20,
                                          child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: '03',
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                                TextSpan(text: " deliveries")
                                              ])),
                                            ),
                                            height: 70.0,
                                            width: 130.0,
                                          ),
                                        ),
                                        const Align(
                                          alignment: FractionalOffset(0.5,
                                              1.0), // Align at the bottom center
                                          child: FractionalTranslation(
                                            translation: Offset(1.3,
                                                0.8), // Adjust position further if needed
                                            child: CircleAvatar(
                                              radius: 25.0,
                                              child: Text("A"),
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment: FractionalOffset(0.5,
                                              1.0), // Align at the bottom center
                                          child: FractionalTranslation(
                                            translation: Offset(0.7,
                                                0.8), // Adjust position further if needed
                                            child: CircleAvatar(
                                              radius: 25.0,
                                              child: Text("B"),
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment: FractionalOffset(0.5,
                                              1.0), // Align at the bottom center
                                          child: FractionalTranslation(
                                            translation: Offset(0.10,
                                                0.8), // Adjust position further if needed
                                            child: CircleAvatar(
                                              radius: 25.0,
                                              child: Text("C"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30.0,
                                      top: 8,
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8), // Circular border with radius 8
                                          ),
                                          elevation: 20,
                                          child: Container(
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "10",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: Color(
                                                                0xFF2C3D63),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextSpan(
                                                        text: " Active \n",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF2C3D63),
                                                        )),
                                                    TextSpan(
                                                        text: "Subscriptions",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF2C3D63),
                                                        ))
                                                  ]),
                                                )),
                                            height: 60.0,
                                            width: 120.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 60.0, bottom: 8),
                                    child: Stack(
                                      children: <Widget>[
                                        Card(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8), // Circular border with radius 8
                                          ),
                                          elevation: 20,
                                          child: Container(
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "119",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            color: Color(
                                                                0xFF2C3D63),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextSpan(
                                                        text: " Pending \n",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF2C3D63),
                                                        )),
                                                    TextSpan(
                                                        text: "Deliveries",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF2C3D63),
                                                        ))
                                                  ]),
                                                )),
                                            height: 60.0,
                                            width: 120.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          //card 2...........................................
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 20,
                            color: Color(0xFF31CE95),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: CircleAvatar(
                                        radius: 60,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset(
                                            'assets/customers-illustration-image.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xFFCE316A))),
                                        onPressed: () {},
                                        child: Text(
                                          "View Customers",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: <Widget>[
                                            Card(
                                              color: Color(0xFFCE316A),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Circular border radius
                                              ),
                                              elevation: 20,
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6.0,
                                                          right: 4.0,
                                                          top: 6),
                                                  child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                        text: "15",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      TextSpan(
                                                          text:
                                                              " New customers",
                                                          style: TextStyle()),
                                                    ]),
                                                  ),
                                                ),
                                                height: 70.0,
                                                width: 140.0,
                                              ),
                                            ),
                                            const Align(
                                              alignment: FractionalOffset(0.5,
                                                  1.0), // Align at the bottom center
                                              child: FractionalTranslation(
                                                translation: Offset(1.3,
                                                    1.0), // Adjust position further if needed
                                                child: CircleAvatar(
                                                  radius: 25.0,
                                                  child: Text("A"),
                                                ),
                                              ),
                                            ),
                                            const Align(
                                              alignment: FractionalOffset(0.5,
                                                  1.0), // Align at the bottom center
                                              child: FractionalTranslation(
                                                translation: Offset(0.7,
                                                    1.0), // Adjust position further if needed
                                                child: CircleAvatar(
                                                  radius: 25.0,
                                                  child: Text("B"),
                                                ),
                                              ),
                                            ),
                                            const Align(
                                              alignment: FractionalOffset(0.5,
                                                  1.0), // Align at the bottom center
                                              child: FractionalTranslation(
                                                translation: Offset(0.10,
                                                    1.0), // Adjust position further if needed
                                                child: CircleAvatar(
                                                  radius: 25.0,
                                                  child: Text("C"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 25.0,
                                          top: 8,
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    8), // Rounded corners with radius 8
                                              ),
                                              elevation: 20,
                                              child: Container(
                                                height: 60.0,
                                                width: 120.0,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween, // Space between text and icon
                                                    children: [
                                                      Text(
                                                        "1.8% ",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF2C3D63),
                                                          fontSize: 25,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .arrow_upward, // Replace with your desired icon
                                                        color: Colors.green,
                                                        size: 25,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Stack(
                                          children: <Widget>[
                                            Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    8), // Rounded corners with radius 8
                                              ),
                                              elevation: 20,
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "10",
                                                          style: TextStyle(
                                                              fontSize: 25,
                                                              color: Color(
                                                                  0xFF2C3D63),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      TextSpan(
                                                          text: " Active \n",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2C3D63),
                                                          )),
                                                      TextSpan(
                                                          text: "Customers",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2C3D63),
                                                          ))
                                                    ]),
                                                  ),
                                                ),
                                                height: 60.0,
                                                width: 120.0,
                                              ),
                                            ),
                                            const Align(
                                              alignment: FractionalOffset(0.5,
                                                  1.0), // Align at the bottom center
                                              child: FractionalTranslation(
                                                translation: Offset(3.0,
                                                    1.0), // Adjust position further if needed
                                                child: CircleAvatar(
                                                  radius: 15.0,
                                                  child: Text("A"),
                                                ),
                                              ),
                                            ),
                                            const Align(
                                              alignment: FractionalOffset(0.5,
                                                  1.0), // Align at the bottom center
                                              child: FractionalTranslation(
                                                translation: Offset(3.5,
                                                    1.0), // Adjust position further if needed
                                                child: CircleAvatar(
                                                  radius: 15.0,
                                                  child: Text("B"),
                                                ),
                                              ),
                                            ),
                                            const Align(
                                              alignment: FractionalOffset(0.5,
                                                  1.0), // Align at the bottom center
                                              child: FractionalTranslation(
                                                translation: Offset(4.0,
                                                    1.0), // Adjust position further if needed
                                                child: CircleAvatar(
                                                  radius: 15.0,
                                                  child: Text("C"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: controller.dateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText:
                                  '${DateFormat('MMMM dd yyyy').format(DateTime.now())}',
                              border: InputBorder.none, // Remove underline
                              isDense: true,
                            ),
                          ),
                          // Adjust space between TextField and subtitle
                          Text(
                            "Today",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    )),
                    Obx(() {
                      // Use Obx to update the DropdownButton when the state changes
                      return DropdownButton<String>(
                        value: controller.dropdownValue.value,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.updateValue(newValue);
                          }
                        },
                        items: <String>[
                          'Timeline',
                          'Customer',
                          'Client',
                          'Orders'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 15,
                            ), // Calendar icon as leading widget
                            SizedBox(
                                width:
                                    8), // Add some space between the icon and the text
                            Text(
                              "${DateFormat('MMMM yyyy').format(DateTime.now())}",
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      for (int i = 1; i <= controller.getLastDayOfMonth(); i++)
                        GestureDetector(
                          onTap: () {
                            DateTime selectedDate = DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              i,
                            );
                            controller.selectDate(selectedDate);
                          },
                          child: Obx(
                            () => Card(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      controller.getDayOfWeek(DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        i,
                                      )),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: controller
                                                    .selectedDate.value.day ==
                                                i
                                            ? Colors
                                                .black // Dark color for selected date
                                            : Colors
                                                .grey, // Light color for other dates
                                      ),
                                    ),
                                    Text(
                                      '$i',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: controller
                                                    .selectedDate.value.day ==
                                                i
                                            ? Colors
                                                .black // Dark color for selected date
                                            : Colors
                                                .grey, // Light color for other dates
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    if (controller.selectedDate.value.day == i)
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 20,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ListTile(
                                title: Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Text("New Order created"),
                                ),
                                subtitle: Text("New order created with order"),
                              ),
                              ListTile(
                                  title: Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      "${DateFormat('hh:mm a').format(DateTime.now())}",
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ),
                                  subtitle: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.orange,
                                      ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: Color(
                                  0xFFFE804E), // Set the circle color to FE804E
                              child: SvgPicture.asset(
                                'assets/Group 914.svg',
                                color: Colors.white,
                                width: 60,
                                height: 60,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationService.buildBottomNavigation(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: ClipRRect(
            borderRadius:
                BorderRadius.circular(50.0), // Adjust the value as needed
            child: FloatingActionButton(
              backgroundColor: Color(0xFF2c3d63),
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
