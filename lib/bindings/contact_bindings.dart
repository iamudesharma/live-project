import 'package:get/get.dart';
import 'package:live_project_1/controller/contact_controller.dart';

class ContactBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactController());
  }
}
