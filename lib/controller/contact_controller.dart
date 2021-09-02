import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController desController;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    desController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    desController.dispose();
    emailController.dispose();
    phoneController.dispose();
    desController.dispose();
    super.onClose();
  }
}

extension SizeBoxs on double {
  SizedBox heightBox() {
    return SizedBox(
      height: this,
    );
  }
}

extension Iconss on Icon {
  Container design() {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          // color: Colors.white,
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: this);
  }
}
