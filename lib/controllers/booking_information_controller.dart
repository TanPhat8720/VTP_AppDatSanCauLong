import 'package:vtp_appcaulong/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtp_appcaulong/models/models.dart';

class BookingInformation extends GetxController {
  var branchName = ''.obs;
  var branchID = ''.obs;
  var note = ''.obs;
  RxList<Court> courts = <Court>[].obs;
  var bookingDate = ''.obs;
  var startTime = ''.obs;
  var endTime = TimeOfDay.now().toString().obs;
  var address = ''.obs;
  var priceID = ''.obs;
  RxDouble prices = 0.0.obs;

  BookingInformation() {
    TimeOfDay nextQuarterHour = Formatter.getNextQuarterHour(TimeOfDay.now());
    startTime = Formatter.formatTimeOfDay(nextQuarterHour).obs;

    endTime = Formatter.formatTimeOfDay(TimeOfDay(
            hour: (nextQuarterHour.hour + 1) % 24,
            minute: nextQuarterHour.minute))
        .obs;
    bookingDate = Formatter.formatDateTime(DateTime.now()).obs;
  }

  UpdateBookingInformation(
      {required branchID,
      required branchName,
      required note,
      required bookingDate,
      required startTime,
      required address,
      required endTime,
      required prices}) {
    this.branchID = branchID as RxString;
    this.branchName = branchName as RxString;
    this.note = note as RxString;
    this.bookingDate = bookingDate as RxString;
    this.startTime = startTime as RxString; // Corrected variable name
    this.endTime = endTime as RxString; // Corrected variable name
    this.prices.value = prices.obs;
  }

  void updateBranch(Branch branch) {
    var rxBranchName = branch.branchName.obs;
    var rxBranchID = branch.branchID.obs;
    this.branchName.value = rxBranchName.value;
    this.branchID.value = rxBranchID.value;
    this.address.value = branch.address.obs.value;
    print(this.branchID);
  }

  void plusPrice(price) {
    prices.value += price;
  }

  void subPrice(price) {
    prices.value -= price;
  }

  void resetChosenCourt() {
    courts = <Court>[].obs;
    prices = 0.0.obs;
  }

  void updateNote(String note) {
    this.note.value = note;
  }

  void updateBookingDate(bookingDate) {
    this.bookingDate.value = Formatter.formatDateTime(bookingDate);
  }

  void updateStartTime(startTime) {
    this.startTime.value = Formatter.formatTimeOfDay(startTime).obs.value;
    print(startTime);
  }

  void updateEndTime(endTime) {
    this.endTime.value = Formatter.formatTimeOfDay(endTime).obs.value;
    print(endTime);
  }

  void updatePrices(prices) {
    this.prices.value = prices;
  }

  void addCourt(Court court) {
    this.courts.add(court);
  }

  void updatePriceID(String priceID) {
    this.priceID.value = priceID;
  }

  void removeCourt(Court court) {
    this.courts.removeWhere((element) => element.courtID == court.courtID);
  }

  bool isCourtExist(Court court) {
    for (Court element in courts) {
      if (element.courtID == court.courtID) return true;
    }
    return false;
  }

  void resetData() {
    branchName = ''.obs;
    branchID = ''.obs;
    note = ''.obs;
    courts = <Court>[].obs;
    address = ''.obs;
    prices = 0.0.obs;
    priceID = ''.obs;
  }
}
