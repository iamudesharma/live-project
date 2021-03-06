// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_project_1/controller/page_controller/page_controller.dart';

class MyApp extends GetView<PageControllers> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: PageView.builder(
          allowImplicitScrolling: true,
          pageSnapping: true,
          scrollBehavior: const ScrollBehavior(
              androidOverscrollIndicator: AndroidOverscrollIndicator.glow),
          physics: const BouncingScrollPhysics(),
          reverse: false,
          scrollDirection: Axis.vertical,
          controller: controller.pageController,
          itemCount: controller.data.length,
          itemBuilder: (context, index) => Obx(
            () => controller.data.value.elementAt(index),
          ),
        ),
      ),
    );
  }
}
