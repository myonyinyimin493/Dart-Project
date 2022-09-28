import 'package:final_year_project/Add_appointment.dart';
import 'package:final_year_project/All_collective_page.dart';
import 'package:final_year_project/Signup_page.dart';
import 'package:final_year_project/View_page.dart';
import 'package:final_year_project/auth_controller.dart';
// import 'package:final_year_projeflutter pub add firebase_storagect/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home:Signup_page(),
    );
  }
}

