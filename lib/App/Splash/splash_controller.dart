import 'package:get/get.dart';
import '../../Helper/session_controller.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      if(Get.find<SessionController>().getUserSession() != null) {
        Get.offAllNamed('/tab');
      } else {
        Get.offAllNamed('/login');
      }
    });
    super.onInit();
  }
}