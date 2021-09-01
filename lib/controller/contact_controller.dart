import 'package:flutter/cupertino.dart';
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
