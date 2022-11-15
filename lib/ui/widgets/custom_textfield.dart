import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? rightIcon;
  final IconData? leftIcon;
  final Function()? onRightIconPressed;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final BoxDecoration? decoration;
  const CustomTextField(
      {Key? key,
      required this.label,
      this.validator,
      required this.hintText,
      required this.controller,
      this.rightIcon,
      this.leftIcon,
      this.onRightIconPressed,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocalizedText(
              label,
              style: AppTheme.normalTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: decoration ?? AppTheme.textFieldDecoration(),
              child: TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  validator: validator,
                  style: AppTheme.normalTextStyle,
                  decoration: AppTheme.textFieldInputDecoration().copyWith(
                    hintText: translate(hintText),
                    suffix: rightIcon != null
                        ? IconButton(
                            icon: Icon(rightIcon),
                            onPressed: onRightIconPressed ?? () {})
                        : null,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorStyle:
                        AppTheme.greySubtitleStyle.copyWith(color: Colors.red),
                    prefix: leftIcon != null ? Icon(leftIcon) : null,
                  )),
            ),
          ],
        ));
  }
}
