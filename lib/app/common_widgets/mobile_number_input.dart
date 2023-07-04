import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_common_button.dart';

class MobileNumberInput extends StatelessWidget {
  final void Function(String value) onChanged;
  final String? Function(String? value)? validator;
  final TextEditingController? textEditingController;
  final void Function() onSendOTPClicked;
  final bool buttonEnabled;

  const MobileNumberInput({super.key, required this.onChanged, this.validator, this.textEditingController, required this.onSendOTPClicked, required this.buttonEnabled});

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: context.colors.appBlueColor, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(30.h),
      ),
    );

    return TextFormField(
      maxLength: 10,
      controller: textEditingController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: false),
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Enter Mobile Number',
          labelText: 'Mobile Number',
          border: inputBorder,
          focusedBorder: inputBorder,
          disabledBorder: inputBorder,
          enabledBorder: inputBorder,
          focusedErrorBorder: inputBorder,
          errorBorder: inputBorder,
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 0.h),
            child: SizedBox(
              width: 100.w,
              child: InkWell(
                onTap: onSendOTPClicked.call,
                child: AppCommonButton(btnText: 'Get OTP', enabled: buttonEnabled),
              ),
            ),
          )),
    );
  }
}
