import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:eliteware_test/presentation/splash/splash_controller.dart';
import 'package:logging/logging.dart';

class SplashPage extends GetView<SplashController> {
  final Logger _logger = Logger('SplashPage');

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.goToLoginPage();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: context.colors.appWhiteColor,
        child: Center(
          child: Hero(
            tag: 'APPLOGO',
            child: Image.asset(
              context.images.appLogo,
              height: 150.w,
              width: 150.w,
            ),
          ),
        ),
      ),
    );
  }
}
