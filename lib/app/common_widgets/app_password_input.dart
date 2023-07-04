import 'package:eliteware_test/app/app_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPasswordInput extends StatelessWidget {
  final int maxLength;
  final bool obscureText;
  final void Function(String value) onChanged;
  final String? Function(String? value)? validator;
  final TextEditingController? textEditingController;
  final void Function() onSuffixIconTapped;

  const AppPasswordInput({
    super.key,
    required this.onChanged,
    this.validator,
    this.textEditingController,
    required this.maxLength,
    required this.obscureText,
    required this.onSuffixIconTapped,
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
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        counterText: '',
        hintText: 'Enter Password',
        labelText: 'Password',
        border: inputBorder,
        focusedBorder: inputBorder,
        disabledBorder: inputBorder,
        enabledBorder: inputBorder,
        focusedErrorBorder: inputBorder,
        errorBorder: inputBorder,
        prefixIcon: Icon(
          Icons.password,
          color: context.colors.appBlueColor,
        ),
        suffixIcon: InkWell(
          onTap: onSuffixIconTapped.call,
          child: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: context.colors.appBlueColor,
          ),
        ),
      ),
    );
  }
}
