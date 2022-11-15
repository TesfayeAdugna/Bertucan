import 'dart:developer';

import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/dialogs/forgot_password_dialog.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/ModalProgressHUD.dart';
import 'package:bertucanfrontend/ui/widgets/custom_dialog.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestForgotPassword extends StatelessWidget {
  RequestForgotPassword({Key? key}) : super(key: key);

  final TextEditingController _emailCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomDialog(
          title: 'forgot_password',
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
                ])),
          ],
          onCancel: () {
            _emailCodeController.clear();
          },
          onConfirm: () async {
            if (_formKey.currentState!.validate()) {
              await _authController.requestResetPassword(
                  RequestResetPassword(email: _emailCodeController.text));
            }
          }),
      Obx(() =>
          ModalProgressHUD(inAsyncCall: _authController.status.isLoading)),
    ]);
  }
}
