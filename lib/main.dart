import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Helper/session_controller.dart';
import 'package:shopix/Localization/language_constants.dart';
import 'package:shopix/Localization/translations.dart';

import 'Routes/routes.dart';
import 'Styles/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SessionController(), permanent: true);
  await Get.find<SessionController>().initialize();
  /// Get.find<SessionController>().getStorageBox.erase();
  /// Get.find<SessionController>().getStorageBox.write('cart', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "app_name".tr,
        debugShowCheckedModeBanner: false,
        locale: createLocale('en'),
        theme: Styles.appTheme(context: context),
        translations: AppTranslations(),
        getPages: AppRoutes.getPages,
        initialRoute: '/splash'
    );
  }
}