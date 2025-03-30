import 'package:get/get.dart';
import '../App/Settings/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}