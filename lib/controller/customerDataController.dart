import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/customerData.dart';

class customerData extends GetxController {
  RxList<CustomersDataModel> customersList = <CustomersDataModel>[].obs;
  @override
  void onInit() {
    // Fetch data when controller is initialized
    customer();
    super.onInit();
  }

  customer() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    try {
      var resp = await http.get(Uri.parse(url));
      // print('responseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${resp.body}');
      if (resp.statusCode == 200) {
        List<dynamic> jsonbody = jsonDecode(resp.body);
        // print('json..............${jsonbody}');
        customersList.assignAll(
            jsonbody.map((data) => CustomersDataModel.fromJson(data)));
      } else {
        throw Exception('Failed to load customers');
      }
    } catch (e) {
      print('Error in response data    ${e}');
    }
  }
}
