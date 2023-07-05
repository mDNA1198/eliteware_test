import 'package:eliteware_test/presentation/login/login_binding.dart';
import 'package:eliteware_test/presentation/login/login_page.dart';
import 'package:eliteware_test/presentation/module_selection/module_selection_binding.dart';
import 'package:eliteware_test/presentation/module_selection/module_selection_screen.dart';
import 'package:eliteware_test/presentation/splash/splash_page.dart';
import 'package:eliteware_test/presentation/timer/timer_binding.dart';
import 'package:eliteware_test/presentation/timer/timer_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splashScreen = '/splash';
  static String moduleSelection = '/module_selection';
  static String timeScreen = '/timer_screen';
  static String loginScreen = '/login_screen';

  static final getPages = <GetPage>[
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.moduleSelection,
      binding: ModuleSelectionBinding(),
      page: () => ModuleSelectionScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      binding: LoginBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.timeScreen,
      binding: TimerBinding(),
      page: () => TimerPage(),
    ),
  ];
}
