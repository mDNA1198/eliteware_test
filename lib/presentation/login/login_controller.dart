import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eliteware_test/app/routes/app_routes.dart';
import 'package:eliteware_test/data/use_cases/login_use_case.dart';
import 'package:eliteware_test/presentation/base/base_controller.dart';
import 'package:logging/logging.dart';

class LoginController extends BaseController {
  final Logger _logger = Logger('LoginController');

  final LoginUseCase _loginUseCase;

  LoginController(this._loginUseCase);

  @override
  void onInit() {
    _logger.fine('onInit');
    super.onInit();
  }
}
