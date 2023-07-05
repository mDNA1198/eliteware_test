import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:eliteware_test/app/common_widgets/app_blue_button.dart';
import 'package:eliteware_test/app/common_widgets/app_password_input.dart';
import 'package:eliteware_test/app/common_widgets/app_regular_input.dart';
import 'package:eliteware_test/app/common_widgets/common_app_bar.dart';
import 'package:eliteware_test/presentation/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class LoginPage extends GetView<LoginController> {
  final Logger _logger = Logger('LoginPage');

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: const CommonAppBar(
          appBarTitle: 'Login',
        ),
        backgroundColor: context.colors.appWhiteColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          height: double.infinity,
          width: double.infinity,
          color: context.colors.appWhiteColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text('Test Email: Developer5@gmail.com'),
                Text('Test Password: 123456',),
                SizedBox(
                  height: 20.h,
                ),
                AppRegularInput(
                  onChanged: controller.onEmailInputChanged,
                  hintText: 'Enter Email',
                  labelText: 'Email',
                  prefixIcon: Icons.alternate_email,
                  maxLength: 60,
                  textEditingController: controller.emailInputController,
                  inputType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter(' ', allow: false)
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () => AppPasswordInput(
                    onChanged: controller.onPasswordInputChanged,
                    maxLength: 10,
                    onSuffixIconTapped: () {
                      controller.obscurePassword.call(!controller.obscurePassword.value);
                    },
                    obscureText: controller.obscurePassword.value,
                    textEditingController: controller.passwordInputController,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Obx(
                  () => AppBlueButton(
                    buttonText: 'Login',
                    onClick: controller.callLoginAPI,
                    enabled: controller.isEmailValid.value &&
                        controller.isPasswordValid.value,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
