import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../view/customerDataView.dart';
import '../view/homeView.dart';
import '../view/locationView.dart';
import '../view/profileView.dart';

class BottomNavigationService {
  static var selectedIndex = 0.obs;

  static void changeIndex(int index) {
    selectedIndex.value = index;
  }

  static Widget buildBottomNavigation() {
    return Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Group 910.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Group 912.svg'),
              label: 'Customer',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on_outlined,
              ),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Group 913.svg'),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex.value,
          onTap: (int index) {
            // Update the current index variable in the controller
            changeIndex(index);
            // Handle navigation or action based on the selected index
            switch (index) {
              case 0:
                Get.to(() => HomePage());
                break;
              case 1:
                Get.to(() => CustomerDataPage());
                break;
              case 2:
                Get.to(() => LocationPage());
                break;
              case 3:
                Get.to(() => ProfilePage());
                break;
            }
          },
        ));
  }
}
