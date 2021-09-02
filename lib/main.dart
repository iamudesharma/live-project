import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_project_1/bindings/contact_bindings.dart';
import 'package:live_project_1/controller/page_controller/page_controller.dart';
import 'package:live_project_1/view/my_app_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(PageControllers());
  runApp(
    GetMaterialApp(
      initialBinding: ContactBindings(),
      home: const MyApp(),
      theme: ThemeData(
        textTheme: GoogleFonts.boogalooTextTheme(),
      ),
    ),
  );
}
