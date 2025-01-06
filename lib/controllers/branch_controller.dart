import 'package:vtp_appcaulong/models/branch_model.dart';
import 'package:vtp_appcaulong/services/remote_services.dart';
import 'package:get/get.dart';

class BranchController extends GetxController {
  var isLoading = true.obs;
  var branchList = <Branch>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await fetchBranches();
    super.onInit();
  }

  Future<void> fetchBranches() async {
    isLoading(true);
    try {
      
      // branchList.value = Branch.branches;
      branchList.value = await RemoteService.getBranches();
      // print(branches);
      if (branchList != []) isLoading(false);
    } catch (e) {
      Get.snackbar('Fetch Branches failed!', e.toString());
    }
  }
}
