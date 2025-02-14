import 'dart:convert';

import 'package:vtp_appcaulong/controllers/booking_information_controller.dart';
import 'package:vtp_appcaulong/controllers/controllers.dart';
import 'package:vtp_appcaulong/models/branch_model.dart';
import 'package:vtp_appcaulong/models/models.dart';
import 'package:vtp_appcaulong/services/share_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../formatter.dart';

class RemoteService {
  static var client = http.Client();
  static String hostname = "https://88a7-171-227-93-122.ngrok-free.app/api/";
  
  static Future<List<Branch>> getBranches() async {
    http.Response response = await http
        .get(Uri.parse(hostname+"branches"));
    if (response.statusCode == 200) {
      return branchFromJson(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<Court>> fetchCourts() async {
    http.Response response = await http
        .get(Uri.parse("https://88a7-171-227-93-122.ngrok-free.app/api/courts"));
    if (response.statusCode == 200) {
      return courtFromJson(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<Price>> fetchPrices() async {
    http.Response response = await http
        .get(Uri.parse(hostname+"prices"));
    if (response.statusCode == 200) {
      return priceFromJson(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<Reservation>> fetchReservations() async {
    http.Response response = await http
        .get(Uri.parse(hostname+"reservations"));
    if (response.statusCode == 200) {
      return reservationFromJson(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<RfDetail>> fetchRfDetails() async {
    http.Response response = await http
        .get(Uri.parse(hostname+"rfdetails"));
    if (response.statusCode == 200) {
      return rfDetailFromJson(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<List<Customer>> fetchCustomers() async {
    http.Response response = await http
        .get(Uri.parse(hostname+"customers"));
    if (response.statusCode == 200) {
      return customerFromJson(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<Customer> loginCustomer(
      String phoneNumber, String password) async {
    final body = jsonEncode({
      'phoneNumber': phoneNumber.toString(),
      'password': password.toString()
    });
    print(body);
    final http.Response res = await http.post(
        Uri.parse(hostname+'auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      return Customer.fromJson(json.decode(utf8.decode(res.bodyBytes)));
    } else {
      print(json.decode(res.body));
      throw Exception(json.decode(res.body)['message']);
    }
  }

  static String convertTimeOfDayToDateTime(
      TimeOfDay tod, DateTime bookingDate) {
    return DateTime(bookingDate.year, bookingDate.month, bookingDate.day,
            tod.hour, tod.minute, 0)
        .toString();
  }

  static Future<http.Response> addReservationAndDetails(String revNo) async {
    try {
      final bookingInformation = Get.find<BookingInformation>();
      final phoneNumber = await SharePrefs.phoneNumber();
      final body = jsonEncode({
        "ReservationNo": revNo,
        "Username": "customerapp",
        "PhoneNumber": phoneNumber,
        "Deposite": bookingInformation.prices.value,
        "CreateDate": DateTime.now().toString(),
        "BookingDate": DateFormat("dd-MM-yyyy")
            .parse(bookingInformation.bookingDate.value)
            .toString(),
        "StartDate": convertTimeOfDayToDateTime(
            Formatter.convertStringToTimeOfDay(
                bookingInformation.startTime.value),
            Formatter.convertStringToDateTime(
                bookingInformation.bookingDate.value)),
        "EndDate": convertTimeOfDayToDateTime(
            Formatter.convertStringToTimeOfDay(
                bookingInformation.endTime.value),
            Formatter.convertStringToDateTime(
                bookingInformation.bookingDate.value)),
        "PriceID": bookingInformation.priceID.value,
        // "PriceID": "P001",
        "_Status": 1,
        "token": LoginController.token
      });

      final http.Response res = await http.post(
          Uri.parse(hostname+'reservations'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      // print(res.statusCode);
      // if (res.statusCode == 200) {
      //   return Customer.fromJson(json.decode(utf8.decode(res.bodyBytes)));
      // } else {
      //   print(json.decode(res.body));
      //   throw Exception(json.decode(res.body)['message']);
      // }
      return res;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  static Future<void> addRfDetails(String revNo, String note) async {
    try {
      final bookingInformation = Get.find<BookingInformation>();
      for (int i = 0; i < bookingInformation.courts.length; i++) {
        var body = jsonEncode({
          "ReservationNo": revNo,
          "CourtID": bookingInformation.courts[i].courtID,
          "Note": note
        });
        http.Response res = await http.post(
            Uri.parse(hostname+'rfDetails'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

        if (res.statusCode != 201) {
          throw Exception();
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static String revNoGenerator() {
    DateTime now = DateTime.now();
    String datetime = now.day.toString() +
        now.month.toString() +
        now.year.toString().substring(3) +
        now.year.toString().substring(3) +
        now.hour.toString() +
        now.microsecond.toString().substring(0, 2);
    return 'Rev$datetime';
  }
}
