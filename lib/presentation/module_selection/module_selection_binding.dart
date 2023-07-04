import 'package:eliteware_test/presentation/module_selection/module_selection_controller.dart';
import 'package:get/get.dart';

class ModuleSelectionBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ModuleSelectionController>(ModuleSelectionController());
  }
}