import 'dart:math';

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

  final TextEditingController emailInputController = TextEditingController(text: '');
  final TextEditingController passwordInputController = TextEditingController(text: '');

  RxBool isEmailValid = false.obs;
  RxBool isPasswordValid = false.obs;
  RxBool obscurePassword = true.obs;

  @override
  void onInit() {
    _logger.fine('onInit');
    super.onInit();
  }

  void onEmailInputChanged(String input) {
    _logger.fine('onEmailInputChanged $input');
    isEmailValid.call(input.isNotEmpty && input.isEmail);
  }

  void onPasswordInputChanged(String input) {
    _logger.fine('onPasswordInputChanged $input');
    isPasswordValid.call(input.trim().isNotEmpty && input.trim().length >= 4);
  }

  Future<void> callLoginAPI() async{
    _logger.fine('callLoginAPI');
    try{
      showLoading(true);
      final loginAPIResult = await _loginUseCase.loginUser(emailInputController.text, passwordInputController.text);
      if(loginAPIResult.code == 0 && loginAPIResult.data != null){

      }
      showToast(loginAPIResult.message);
    }catch(e){
      showToast(e.toString());
      _logger.severe('callLoginAPI error $e');
    }finally{
      showLoading(false);
    }
  }
}
