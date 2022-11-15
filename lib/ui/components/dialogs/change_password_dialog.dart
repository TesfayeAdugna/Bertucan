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

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordController2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomDialog(
            title: 'change_password',
            content: [
              Form(
                  key: _formKey,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CustomTextField(
                      label: 'old_password',
                      controller: _oldPasswordController,
                      obscureText: true,
                      hintText: 'enter_your_password',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return translate("password_canot_be_null");
                        }
                      },
                    ),
                    CustomTextField(
                        label: 'new_password',
                        controller: _newPasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        hintText: 'enter_your_password',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return translate("password_canot_be_null");
                          } else if (value.trim() !=
                              _newPasswordController.text) {
                            return 'the_two_passwords_are_not_the_same';
                          }
                        }),
                    CustomTextField(
                      label: 'confirm_new_password',
                      controller: _newPasswordController2,
                      obscureText: true,
                      hintText: 'enter_your_password',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value != _newPasswordController.text) {
                          return translate("password_is_not_the_same");
                        }
                      },
                    ),
                  ])),
            ],
            onCancel: () {
              _newPasswordController.clear();
              _oldPasswordController.clear();
            },
            onConfirm: () async {
              if (_formKey.currentState!.validate()) {
                _authController.changePassword(PasswordToChange(
                    old_password: _oldPasswordController.text,
                    new_password: _newPasswordController.text));
              }
            }),
        Obx(() => ModalProgressHUD(
              inAsyncCall: _authController.status.isLoading,
            )),
      ],
    );
  }
}
