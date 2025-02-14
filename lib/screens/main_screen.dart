import 'package:vtp_appcaulong/config/config.dart';
import 'package:vtp_appcaulong/screens/screens.dart';
import 'package:vtp_appcaulong/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = '/main';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const MainScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final CustomDrawerController drawerController = CustomDrawerController();
    final mainScreenController = Get.put(MainScreenController());
    final branchController = Get.put(BranchController());
    final key = drawerController.scaffoldKey;
    return Scaffold(
      appBar: CustomHasTitleAppbar(
        controller: drawerController,
      ),
      endDrawer: CustomDrawer(
        controller: drawerController,
      ),
      key: key,
      bottomNavigationBar: Obx(
        () => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(minPadding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(defaultBorderRadius * 2),
              child: NavigationBar(
                elevation: 0,
                indicatorColor: primaryColor,
                height: 58,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                backgroundColor: primaryColor,
                onDestinationSelected: (int index) {
                  if (branchController.isLoading.isFalse)
                    setState(() {
                      if (index == 0) {
                        Get.delete<MyBookingController>();
                      }
                      mainScreenController.currentPageIndex.value = index;
                    });
                },
                selectedIndex: mainScreenController.currentPageIndex.value,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      selectedIcon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: 'Home'),
                  NavigationDestination(
                      icon: Icon(
                        Icons.article_outlined,
                        color: Colors.white,
                      ),
                      selectedIcon: Icon(
                        Icons.article,
                        color: Colors.white,
                      ),
                      label: 'My Booking'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => [
            const HomeScreen(),
            const MyBookingScreen()
          ][mainScreenController.currentPageIndex.value]),
    );
  }
}
