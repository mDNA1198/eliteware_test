import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCommonButton extends StatelessWidget {
  final bool enabled;
  final String btnText;

  const AppCommonButton(
      {super.key, required this.enabled, required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      height: 50.h,
      decoration: BoxDecoration(
        color:
        enabled ? context.colors.appBlueColor : context.colors.appGreyColor,
        borderRadius: BorderRadius.circular(25.h),
      ),
      child: Center(
        child: Text(
          btnText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.sp,
            color: context.colors.appWhiteColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
