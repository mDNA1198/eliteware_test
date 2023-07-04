import 'package:get/get.dart';
import 'package:eliteware_test/app/routes/app_routes.dart';
import 'package:eliteware_test/presentation/base/base_controller.dart';
import 'package:logging/logging.dart';

class SplashController extends BaseController{
  final Logger _logger = Logger('SplashController');

  @override
  void onInit() {
    _logger.fine('onInit');
    super.onInit();
  }

  void goToLoginPage(){
    _logger.fine('goToLoginPage');
    Future.delayed(const Duration(seconds: 2), (){
      Get.offNamed(AppRoutes.moduleSelection);
    });
  }
}