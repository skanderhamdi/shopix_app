import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopix/App/Login/login_controller.dart';

import '../../Helper/constants.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(Constants.appLogo, width: Get.width / 4, fit: BoxFit.cover)),
              const SizedBox(height: 40),
              Text('welcome_to_shopix'.tr, style: Get.textTheme.headlineLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('make_your_shopping_easier'.tr, style: Get.textTheme.headlineSmall!.copyWith(color: Get.theme.colorScheme.primaryContainer.withOpacity(0.5), fontWeight: FontWeight.w400)),
              const SizedBox(height: 30),
              Text('login_to_your_account'.tr, style: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: Get.textTheme.titleLarge,
                      validator: (value) {
                        if(value?.isEmpty ?? true) {
                          return 'should_not_be_empty'.tr;
                        }
                        if(!GetUtils.isEmail(value!)) {
                          return 'should_be_a_valid_email'.tr;
                        }
                        return null;
                      },
                      onSaved: (value) => controller.email = value ?? '',
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
                    const SizedBox(height: 10),
                    Obx(() =>
                        TextFormField(
                            style: Get.textTheme.titleLarge,
                            obscureText: !controller.showPassword.value,
                            validator: (value) {
                              if(value?.isEmpty ?? true) {
                                return 'should_not_be_empty'.tr;
                              }
                              return null;
                            },
                            onSaved: (value) => controller.password = value ?? '',
                            decoration: InputDecoration(
                              filled: false,
                              hintText: 'password'.tr,
                              prefixIcon: Icon(Icons.lock_outline, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3)),
                              suffixIcon: IconButton(
                                  onPressed: () => controller.showPassword.value = !controller.showPassword.value,
                                  icon: Icon(controller.showPassword.value ? CupertinoIcons.eye_slash : CupertinoIcons.eye, color: Get.theme.colorScheme.primaryContainer.withOpacity(0.3))
                              ),
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
                        )
                    )
                  ]
                )
              ),
              const SizedBox(height: 25),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Get.theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  onPressed: controller.submit,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Opacity(
                        opacity: 0,
                        child: Icon(Icons.arrow_forward, color: Colors.white)
                      ),
                      Text('login'.tr, style: Get.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                      const Icon(Icons.arrow_forward, color: Colors.white)
                    ]
                  )
              ),
              const SizedBox(height: 30),
              Center(
                child: RichText(
                    text: TextSpan(
                      text: 'you_do_not_have_an_account'.tr,
                      style: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primaryContainer, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: ' ${'signup_now'.tr}',
                          style: Get.textTheme.titleLarge!.copyWith(color: Get.theme.colorScheme.primary, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Get.offAllNamed('/signup');
                          }
                        )
                      ]
                    )
                )
              )
            ]
          )
        )
      )
    );
  }
}