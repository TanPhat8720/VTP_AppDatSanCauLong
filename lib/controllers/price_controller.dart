import 'package:vtp_appcaulong/services/remote_services.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class PriceController extends GetxController {
  var isLoading = true.obs;
  var priceList = <Price>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchPrices();
    super.onInit();
  }

  Future<void> fetchPrices() async {
    isLoading(true);
    try {
      var prices = Price.prices;
      // var prices = await RemoteService.fetchPrices();
      if (prices != []) priceList.value = prices;
    } finally {
      isLoading(false);
    }
  }
}
