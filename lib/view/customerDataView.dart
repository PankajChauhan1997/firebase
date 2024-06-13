import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pankaj_fires/model/customerData.dart';
import 'package:pankaj_fires/view/homeView.dart';

import '../controller/customerDataController.dart';

class customerDataPage extends StatelessWidget {
  customerData controller = Get.put(customerData());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.to(() => HomePage());
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text('Customers data'),
        ),
        body: Center(child: Obx(() {
          if (controller.customersList.isEmpty) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: controller.customersList.length,
                itemBuilder: (context, index) {
                  CustomersDataModel user = controller.customersList[index];
                  return ListTile(
                      title: Text(user.name), subtitle: Text(user.email));
                });
          }
        })),
      ),
    );
  }
}
