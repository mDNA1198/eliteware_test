import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:eliteware_test/presentation/splash/splash_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'app/routes/app_routes.dart';

class App extends StatelessWidget {
  static const tag = 'App';

  final Logger _logger;

  App()
      : _logger = Logger(tag),
        super(key: const ValueKey(tag));

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: context.iPhone14,
      builder: (context, child) {
        _logger.fine('build: ScreenUtilInit::builder ');
        return GetMaterialApp(
          title: 'ElitewareTest',
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'AppFonts',
            scaffoldBackgroundColor: context.colors.appWhiteColor,
            dialogBackgroundColor: context.colors.appWhiteColor,
            splashColor: context.colors.appWhiteColor,
            colorScheme: ColorScheme.light(
              primary: context.colors.appBlueColor,
              secondary: context.colors.appGreyColor,
              surface: context.colors.appWhiteColor,
              background: context.colors.appWhiteColor,
            ),
            // elevatedButtonTheme: ElevatedButtonThemeData(
            //   style: context.buttonStyles.submitButton,
            // ),
          ),
          initialBinding: SplashBinding(),
          debugShowCheckedModeBanner: false,
          getPages: AppRoutes.getPages,
          initialRoute: AppRoutes.splashScreen,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
