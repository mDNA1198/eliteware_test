import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRegularInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData? prefixIcon;
  final int maxLength;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;

  final void Function(String value) onChanged;
  final String? Function(String? value)? validator;
  final TextEditingController? textEditingController;

  const AppRegularInput({
    super.key,
    required this.onChanged,
    this.validator,
    this.textEditingController,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    required this.maxLength,
    this.inputType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: context.colors.appBlueColor, width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(30.h),
      ),
    );

    return TextFormField(
      maxLength: maxLength,
      controller: textEditingController,
      validator: validator,
      onChanged: onChanged,
      keyboardType: inputType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        labelText: labelText,
        border: inputBorder,
        focusedBorder: inputBorder,
        disabledBorder: inputBorder,
        enabledBorder: inputBorder,
        focusedErrorBorder: inputBorder,
        errorBorder: inputBorder,
        prefixIcon: Icon(
          prefixIcon,
          color: context.colors.appBlueColor,
        ),
      ),
    );
  }
}
