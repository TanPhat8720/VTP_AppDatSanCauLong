import 'package:vtp_appcaulong/models/hive_customer.dart';
import 'package:vtp_appcaulong/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/config.dart';
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveCustomerAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicatio∂.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: LoginScreen.routeName,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const LoginScreen(),
    );
  }
}
