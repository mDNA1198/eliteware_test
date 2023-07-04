import 'package:get/get.dart';
import 'package:eliteware_test/data/repository_impl/login_repository_impl.dart';
import 'package:eliteware_test/data/use_cases/login_use_case.dart';
import 'package:eliteware_test/presentation/login/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<LoginRepositoryImpl>(LoginRepositoryImpl());
    Get.put<LoginUseCase>(LoginUseCase(Get.find<LoginRepositoryImpl>()));

    Get.put<LoginController>(LoginController(Get.find<LoginUseCase>()));
  }
}