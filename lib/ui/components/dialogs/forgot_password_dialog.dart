import 'dart:developer';

import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/ModalProgressHUD.dart';
import 'package:bertucanfrontend/ui/widgets/custom_dialog.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetForgotPassword extends StatelessWidget {
  ResetForgotPassword({Key? key}) : super(key: key);

  final TextEditingController _emailCodeController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomDialog(
        title: 'reset_password',
        content: [
          Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                CustomTextField(
                  label: 'email',
                  controller: _emailCodeController,
                  hintText: 'enter_email',
                  keyboardType: TextInputType.text,
                ),
                CustomTextField(
                  label: 'code',
                  controller: _codeController,
                  hintText: 'enter_your_code',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return translate("code_canot_be_null");
                    }
                  },
                ),
                CustomTextField(
                  label: 'new_password',
                  controller: _passwordController,
                  obscureText: true,
                  hintText: 'enter_new_password',
                )
              ])),
        ],
        onCancel: () {
          _emailCodeController.clear();
          _codeController.clear();
          _passwordController.clear();
        },
        onConfirm: () async {
          if (_formKey.currentState!.validate()) {
            await _authController.resetPassword(ResetPassword(
              email: _emailCodeController.text,
              code: _codeController.text,
              new_password: _passwordController.text,
            ));
          }
        },
      ),
      Obx(() =>
          ModalProgressHUD(inAsyncCall: _authController.status.isLoading)),
    ]);
  }
}
