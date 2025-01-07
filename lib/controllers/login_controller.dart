import 'dart:convert';
import 'package:vtp_appcaulong/config/config.dart';
import 'package:vtp_appcaulong/controllers/app_local_data_controller.dart';
import 'package:vtp_appcaulong/screens/screens.dart';
import 'package:vtp_appcaulong/services/share_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../models/customer_model.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var phoneNumberController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  static String token="";
  final localData = Get.put(LocalDataController());

  void login() async {
    try {
      isLoading(true);
      final body = jsonEncode({
        "phoneNumber": phoneNumberController.value.text,
        "password": passwordController.value.text
      });
      final res = await post(
          Uri.parse('https://88a7-171-227-93-122.ngrok-free.app/api/auth/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      if (res.statusCode == 200) {
        isLoading(false);
        phoneNumberController.value.clear();
        passwordController.value.clear();
        // await HiveHelper.saveCustomerLocally(HiveHelper.convertToHiveCustomer(
        //     Customer.fromJson(json.decode(utf8.decode(res.bodyBytes)))));
        final customer =
            Customer.fromJson(json.decode(utf8.decode(res.bodyBytes)));
        token = customer.accessToken;
        // print(customer);
        await SharePrefs.saveCustomerDataLocally(customer);
        localData.updateCustomer(customer);
        Get.offAndToNamed(MainScreen.routeName);
        Get.snackbar('Login Successfully', 'Welcome back!',
            backgroundColor: primaryColor, colorText: Colors.white);
      } else if (phoneNumberController.value.text == '' ||
          passwordController.value.text == '') {
        isLoading(false);
        Get.snackbar('Login Failed', 'Phone number or password cannot be null',
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      } else {
        isLoading(false);
        Get.snackbar('Login Failed', 'Wrong phone number or password',
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch (e) {
      isLoading(false);
      Get.snackbar('Login Failed', 'An error occured',
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    }
  }
  // login() async {
  //   isLoading(true);
  //   Get.offAndToNamed(MainScreen.routeName);
  //   isLoading(false);
  // }
}
