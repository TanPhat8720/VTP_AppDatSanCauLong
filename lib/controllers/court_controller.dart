import 'package:vtp_appcaulong/services/remote_services.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class CourtController extends GetxController {
  var isLoading = true.obs;
  var courtList = <Court>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchCourts();
    super.onInit();
  }

  Future<void> fetchCourts() async {
    isLoading(true);
    try {
      var courts = await RemoteService.fetchCourts();
      // var courts = await Court.courts;
      if (courts != []) courtList.value = courts;
    } finally {
      isLoading(false);
    }
  }
}
