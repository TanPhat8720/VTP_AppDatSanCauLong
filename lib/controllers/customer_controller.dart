import 'dart:async';
import 'dart:convert';

import 'package:vtp_appcaulong/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../models/models.dart';

class CustomerController extends GetxController {
  var isLoading = true.obs;
  var customerList = <Customer>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    // fetchCustomer();
    super.onInit();
  }

  void fetchCustomer() async {
    isLoading(true);
    try {
      var customers = Customer.customers;
      // var prices = await RemoteService.fetchCustomers();
      if (customers != []) customerList.value = customers;
    } finally {
      isLoading(false);
    }
  }

  Future<Customer?> getCustomerByPhoneNumber(String phoneNumber) async {
    isLoading(true);
    try {
      final res = await get(
        Uri.parse(
            'https://88a7-171-227-93-122.ngrok-free.app/api/customers/${phoneNumber}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200) {
        isLoading(false);
        print(res.body);
        return Customer.fromJson(json.decode(res.body));
      } else {
        isLoading(false);
        return Customer(
            username: 'null',
            name: 'null',
            email: 'null',
            status: 'null',
            phoneNumber: 'null',
            accessToken: 'null',
            refreshToken: 'null');
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar("Get data failed", e.toString());
      return null;
    }
  }
}
