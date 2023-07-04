import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBlueButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onClick;
  final bool enabled;
  final EdgeInsets padding;
  final String heroTag;

  const AppBlueButton({
    Key? key,
    required this.buttonText,
    required this.onClick,
    this.padding = const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 10.0),
    required this.enabled,
    this.heroTag = 'MYBLUEBUTTON',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle regularButton = ElevatedButton.styleFrom(
        backgroundColor: context.colors.appBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.5).h,
        ));

    return Hero(
      tag: heroTag,
      child: Padding(
        padding: padding,
        child: SizedBox(
          width: double.infinity,
          height: 55.h,
          child: ElevatedButton(
            style: regularButton,
            onPressed: enabled
                ? () {
                    onClick?.call();
                  }
                : null,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 18.sp,
                color: context.colors.appWhiteColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
