import 'package:eliteware_test/presentation/timer/timer_controller.dart';
import 'package:get/get.dart';

class TimerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TimerController>(TimerController());
  }
}
