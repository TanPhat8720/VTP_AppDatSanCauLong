import 'package:vtp_appcaulong/services/remote_services.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class RfDetailController extends GetxController {
  var isLoading = true.obs;
  var rfDetailList = <RfDetail>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchReservations();
    super.onInit();
  }

  Future<void> fetchReservations() async {
    isLoading(true);
    try {
      // var rfDetails = await RemoteService.fetchRfDetails();
      var rfDetails = await RfDetail.rfDetails;
      if (rfDetails != []) rfDetailList.value = rfDetails;
    } finally {
      isLoading(false);
    }
  }
}
