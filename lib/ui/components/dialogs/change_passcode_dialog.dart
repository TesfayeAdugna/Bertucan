import 'dart:developer';

import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/custom_dialog.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPassCode extends StatelessWidget {
  SetPassCode({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();

  final TextEditingController _oldPassCodeController = TextEditingController();
  final TextEditingController _passCodeController = TextEditingController();
  final TextEditingController _passCodeController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hasPasscode = false;
  @override
  Widget build(BuildContext context) {
    hasPasscode = _authController.getPasscode() != null;
    return CustomDialog(
        title: 'passcode',
        content: [
          Form(
              key: _formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                hasPasscode
                    ? CustomTextField(
                        label: 'enter_old_passcode',
                        controller: _oldPassCodeController,
                        obscureText: true,
                        hintText: 'enter_old_passcode',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return translate("passcode_canot_be_null");
                          }
                        },
                      )
                    : SizedBox(),
                CustomTextField(
                  label: 'enter_passcode',
                  controller: _passCodeController,
                  obscureText: true,
                  hintText: 'enter_your_passcode',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return translate("passcode_canot_be_null");
                    }
                    if (value.length != 4) {
                      return translate("passcode_should_have_a_length_of_4");
                    }
                  },
                ),
                CustomTextField(
                    label: 'confirm_passcode',
                    controller: _passCodeController2,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    hintText: 'enter_your_passcode',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return translate("passcode_canot_be_null");
                      } else if (value.trim() != _passCodeController.text) {
                        return 'the_two_passcodes_are_not_the_same';
                      }
                    })
              ])),
        ],
        onCancel: () {
          _oldPassCodeController.clear();
          _passCodeController.clear();
          _passCodeController2.clear();
        },
        onConfirm: () {
          if (_formKey.currentState!.validate()) {
            if (hasPasscode) {
              if (_authController.getPasscode() ==
                  _oldPassCodeController.text) {
                _authController.setPasscode(_passCodeController.text);
                _oldPassCodeController.clear();
                _passCodeController.clear();
                _passCodeController2.clear();
                Get.back();
              } else {
                toast('error', 'old_passcode_is_not_correct');
              }
            } else {
              _authController.setPasscode(_passCodeController.text);
              _passCodeController.clear();
              _passCodeController2.clear();
              Get.back();
            }
          }
        });
  }
}
