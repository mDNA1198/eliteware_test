import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:eliteware_test/app/common_widgets/mobile_number_input.dart';
import 'package:eliteware_test/presentation/login/login_controller.dart';
import 'package:logging/logging.dart';

class LoginPage extends GetView<LoginController> {
  final Logger _logger = Logger('LoginPage');

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: context.colors.appWhiteColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          height: double.infinity,
          width: double.infinity,
          color: context.colors.appWhiteColor,
          child: Center(
            child: SizedBox(
              height: 30.h,
              width: 30.h,
            ),
          ),
        ),
      ),
    );
  }
}
