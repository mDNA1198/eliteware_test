import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:eliteware_test/app/common_widgets/app_blue_button.dart';
import 'package:eliteware_test/app/common_widgets/app_regular_input.dart';
import 'package:eliteware_test/app/common_widgets/common_app_bar.dart';
import 'package:eliteware_test/app/utils/numeric_range_input_formatter.dart';
import 'package:eliteware_test/presentation/timer/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class TimerPage extends GetView<TimerController> {
  final Logger _logger = Logger('TimerPage');

  TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: const CommonAppBar(
          appBarTitle: 'Timer Module',
        ),
        body: Container(
          color: context.colors.appWhiteColor,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  color: context.colors.appGreyColor,
                  thickness: 1,
                  endIndent: 10.w,
                  indent: 10.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    'Stopwatch',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: context.colors.appBlueColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                  child: Obx(
                    () => Text(
                      controller.timerTime.value,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppBlueButton(
                        buttonText: 'Start Timer',
                        onClick: controller.startStopWatch,
                        enabled: true,
                      ),
                    ),
                    Expanded(
                      child: AppBlueButton(
                        buttonText: 'Reset Timer',
                        onClick: controller.resetStopWatch,
                        enabled: true,
                        heroTag: 'ResetBtn',
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: context.colors.appGreyColor,
                  thickness: 1,
                  endIndent: 10.w,
                  indent: 10.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    'Count Down Timer',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: context.colors.appBlueColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: AppRegularInput(
                          onChanged: (s) {},
                          hintText: 'Enter Minutes',
                          labelText: 'Minutes',
                          maxLength: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          inputType: const TextInputType.numberWithOptions(
                              decimal: false, signed: true),
                          textEditingController:
                              controller.inputControllerForMinutes,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: AppRegularInput(
                          onChanged: (s) {},
                          hintText: 'Enter Seconds',
                          labelText: 'Seconds',
                          maxLength: 2,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            NumericRangeInputFormatter(min: 1, max: 59)
                          ],
                          inputType: const TextInputType.numberWithOptions(
                              decimal: false, signed: true),
                          textEditingController:
                              controller.inputControllerForSeconds,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Obx(
                    () => Text(
                      controller.countDownTimerTime.value,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppBlueButton(
                        buttonText: 'Start Countdown',
                        onClick: () => controller.startCountDownTimer(() {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return dialogWhenCountDownEnds();
                              });
                        }),
                        enabled: true,
                        padding: EdgeInsets.zero,
                        heroTag: 'CountDownBtn1',
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: AppBlueButton(
                          buttonText: 'Reset Countdown',
                          onClick: controller.resetCountDownTimer,
                          enabled: true,
                          heroTag: 'CountDownBtn2',
                          padding: EdgeInsets.zero),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dialogWhenCountDownEnds() {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Count Down Ended',
              style: TextStyle(fontSize: 15.sp, color: Colors.blue),
            ),
            AppBlueButton(
              buttonText: 'Close Dialog',
              onClick: Get.back,
              enabled: true,
              heroTag: 'Dialog Btn',
            ),
          ],
        ),
      ),
    );
  }
}
