import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class BaseController extends GetxController {
  final Logger _logger = Logger('BaseController');

  void showToast(String? message) {
    if (message != null) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF5061FF),
        textColor: const Color(0xFFFFFFFF),
        fontSize: 13.0.sp,
      );
    }
  }

  void showLoading(bool task) {
    if (task) {
      EasyLoading.instance.userInteractions = false;
      EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
      EasyLoading.instance.maskType = EasyLoadingMaskType.custom;
      EasyLoading.instance.maskColor = const Color(0xFFFFFFFF).withOpacity(0.8);

      EasyLoading.instance.textColor = Colors.transparent;
      EasyLoading.instance.indicatorColor = Colors.black;
      EasyLoading.instance.progressColor = Colors.black;
      EasyLoading.instance.backgroundColor = Colors.transparent;
      EasyLoading.instance.boxShadow = [];

      EasyLoading.show(
        dismissOnTap: false,
        indicator: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 50.h,
            width: 50.h,
            child: const CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        ),
      );
      return;
    }
    EasyLoading.dismiss();
  }

  @override
  void onClose() {
    _logger.fine('onInit');
    super.onClose();
  }
}
