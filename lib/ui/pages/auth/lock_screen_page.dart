import 'dart:developer';

import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';

class LockScreenPage extends StatelessWidget {
  const LockScreenPage({Key? key}) : super(key: key);
  AuthController get authController => Get.find();
  @override
  Widget build(BuildContext context) {
    return ScreenLock(
      screenLockConfig:
          ScreenLockConfig(backgroundColor: AppTheme.primaryColor),
      correctString: authController.getPasscode()!,
      didUnlocked: () {
        Get.offAndToNamed(Routes.homePage);
      },
      secretsConfig: SecretsConfig(
          spacing: 15, // or spacingRatio
          padding: const EdgeInsets.all(40),
          secretConfig: SecretConfig(
            disabledColor: Colors.grey,
            enabledColor: AppTheme.primaryColor,
            height: 15,
            width: 15,
          )),
      keyPadConfig: KeyPadConfig(
        buttonConfig: StyledInputConfig(
          textStyle: StyledInputConfig.getDefaultTextStyle(context).copyWith(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          buttonStyle: OutlinedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
          ),
        ),
      ),
      cancelButton: const Icon(Icons.edit, color: Colors.black),
    );
  }
}
