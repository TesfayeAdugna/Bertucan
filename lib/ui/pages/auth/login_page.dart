import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/dialogs/forgot_password_dialog.dart';
import 'package:bertucanfrontend/ui/components/dialogs/request_forgot_password_dialog.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/ModalProgressHUD.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rectangular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _forgotEmailController = TextEditingController();

  bool isPasswordVisible = false;

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                'assets/login.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              const LocalizedText(
                "welcome_back,",
                style: AppTheme.thinTextStyle,
              ),
              const LocalizedText(
                "login_with",
                style: AppTheme.titleStyle,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextField(
                label: "email",
                hintText: "marry_doe",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                label: "password",
                hintText: "password",
                controller: _passwordController,
                rightIcon:
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                obscureText: !isPasswordVisible,
                onRightIconPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                  print("sett");
                },
              ),
              InkWell(
                onTap: () {
                  Get.dialog(
                    RequestForgotPassword(),
                    barrierColor: Colors.grey.withOpacity(0.1),
                  );
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: LocalizedText(
                    'forgot_password',
                    style: AppTheme.thinTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                () => RectangularButton(
                  label: "login",
                  onPressed: () async {
                    await _authController.signIn(UserToLogin(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ));
                  },
                  isActive: !_authController.status.isLoading,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: LocalizedText(
                  "or",
                  style: AppTheme.thinTextStyle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RectangularButton(
                  label: "continue_without_account",
                  isColorPrimary: false,
                  onPressed: () {
                    Get.toNamed(Routes.questionnairePage);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LocalizedText(
                    "don't_have_an_account",
                    style: AppTheme.thinTextStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.signupPage);
                    },
                    child: const LocalizedText(
                      "sign_up",
                      style: AppTheme.buttonLabelStyle2,
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
        Obx(() =>
            ModalProgressHUD(inAsyncCall: _authController.status.isLoading))
      ],
    ));
  }
}

// SvgPicture.asset(
//                   'assets/undraw_certification_aif8.svg',
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.4,
//                 ),