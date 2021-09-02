import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_project_1/data/page_data.dart';

class PageControllers extends GetxController {
  late PageController pageController;

  var data = ListWidgetDate.widget.obs;

  @override
  void onInit() {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    super.onInit();
  }
}
