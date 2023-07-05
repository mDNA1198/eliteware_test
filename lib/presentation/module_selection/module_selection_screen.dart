import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:eliteware_test/app/common_widgets/app_blue_button.dart';
import 'package:eliteware_test/app/common_widgets/common_app_bar.dart';
import 'package:eliteware_test/app/routes/app_routes.dart';
import 'package:eliteware_test/presentation/module_selection/module_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class ModuleSelectionScreen extends GetView<ModuleSelectionController> {
  final Logger _logger;

  ModuleSelectionScreen({super.key})
      : _logger = Logger('ModuleSelectionScreen');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: const CommonAppBar(
          appBarTitle: 'Select Module',
        ),
        backgroundColor: context.colors.appWhiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            AppBlueButton(
              buttonText: 'Timer Module',
              onClick: () {
                Get.toNamed(AppRoutes.timeScreen);
              },
              enabled: true,
              heroTag: 'TimerBtnHero',
            ),
            AppBlueButton(
              buttonText: 'Login Module',
              onClick: () {
                Get.toNamed(AppRoutes.loginScreen);
              },
              enabled: true,
              heroTag: 'LoginBtnHero',
            ),
          ],
        ),
      ),
    );
  }
}
