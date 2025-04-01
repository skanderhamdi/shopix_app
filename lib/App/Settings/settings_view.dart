import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/Helper/session_controller.dart';
import 'settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('settings'.tr, style: Get.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                                Text('profile_and_app_settings'.tr, style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w400, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5))),
                              ]
                          ),
                          const Spacer(),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: controller.saveChanges,
                            child: Text('save_changes'.tr, style: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primary))
                          )
                        ]
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('account_settings'.tr, style: Get.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                        style: Get.textTheme.titleLarge,
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: false,
                          hintText: 'email_address'.tr,
                          prefixIcon: Icon(Icons.email_outlined, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3)),
                          hintStyle: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3), fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primary,
                                  width: 1
                              )
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.error,
                                  width: 1
                              )
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                        style: Get.textTheme.titleLarge,
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          filled: false,
                          hintText: 'new_password'.tr,
                          prefixIcon: Icon(Icons.lock_outline, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3)),
                          hintStyle: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3), fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primary,
                                  width: 1
                              )
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.error,
                                  width: 1
                              )
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                        style: Get.textTheme.titleLarge,
                        controller: controller.passwordConfirmationController,
                        decoration: InputDecoration(
                          filled: false,
                          hintText: 'new_password_confirmation'.tr,
                          prefixIcon: Icon(Icons.lock_outline, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3)),
                          hintStyle: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3), fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primary,
                                  width: 1
                              )
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.error,
                                  width: 1
                              )
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                        style: Get.textTheme.titleLarge,
                        controller: controller.fullnameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: false,
                          hintText: 'fullname'.tr,
                          prefixIcon: Icon(Icons.person_outline_rounded, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3)),
                          hintStyle: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3), fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primaryContainer.withOpacity(0.25),
                                  width: 1
                              )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.primary,
                                  width: 1
                              )
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Get.theme.colorScheme.error,
                                  width: 1
                              )
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    height: 40,
                    color: Get.theme.colorScheme.primaryContainer.withOpacity(0.05),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('application_settings'.tr, style: Get.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('application_language'.tr, style: Get.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold, color: Get.theme.colorScheme.primaryContainer)),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: GetBuilder<SessionController>(
                      builder: (sessionController) {
                        return Row(
                          children: [
                            Expanded(
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  sessionController.setLocale('en');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Get.locale?.languageCode == 'en' ? Get.theme.colorScheme.primary : Colors.transparent,
                                      width: 3
                                    )
                                  ),
                                  child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/flags/us.png'))
                                ),
                              )
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    sessionController.setLocale('fi');
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Get.locale?.languageCode == 'fi' ? Get.theme.colorScheme.primary : Colors.transparent,
                                              width: 3
                                          )
                                      ),
                                      child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/flags/finland.png'))
                                  ),
                                )
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    sessionController.setLocale('fr');
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Get.locale?.languageCode == 'fr' ? Get.theme.colorScheme.primary : Colors.transparent,
                                              width: 3
                                          )
                                      ),
                                      child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/flags/france.png'))
                                  )
                                )
                            )
                          ]
                        );
                      }
                    )
                  )
                ]
            )
          )
        )
    );
  }
}