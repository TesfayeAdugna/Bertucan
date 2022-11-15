import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/ModalProgressHUD.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rectangular_button.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  PickedFile? _imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 40, top: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const LocalizedText(
                              "hello_there,",
                              style: AppTheme.thinTextStyle,
                            ),
                            const LocalizedText(
                              "sign_up_with",
                              style: AppTheme.titleStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        DropdownButton<Locale>(
                            hint: LocalizedText(
                              "set_language",
                              style: AppTheme.hintTextStyle,
                            ),
                            onChanged: (value) {
                              if (value != null) {
                                _authController.setLocale(value);
                              }
                            },
                            items: const <DropdownMenuItem<Locale>>[
                              DropdownMenuItem(
                                value: Locale('am', 'ET'),
                                child: Text('Amharic'),
                              ),
                              DropdownMenuItem(
                                value: Locale('or', 'ET'),
                                child: Text('Oromifa'),
                              ),
                              DropdownMenuItem(
                                value: Locale('tg', 'ET'),
                                child: Text('Tigrigna'),
                              ),
                              DropdownMenuItem(
                                value: Locale('en', 'US'),
                                child: Text('English'),
                              )
                            ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    label: "full_name",
                    hintText: "marry_doe",
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return translate("full_name_required");
                      }
                      if (value.trim().split(" ").length != 2) {
                        return "full_name_pattern_required";
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: "email",
                    hintText: "username@example.com",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return translate("email_required");
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return translate("invalid_email");
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: "phone",
                    hintText: "09923...",
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return translate("phone_required");
                      }
                      if (!RegExp(r"^(?:\+2519|09)[0-9]{8}$").hasMatch(value)) {
                        return translate("invalid_phone");
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: "password",
                    hintText: "password",
                    controller: _passwordController,
                    rightIcon: isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    obscureText: !isPasswordVisible,
                    onRightIconPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                      print("sett");
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return translate("password_required");
                      }
                      if (value.length < 6) {
                        return translate("password_too_short");
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Obx(
                    () => RectangularButton(
                      label: "register",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _authController.signUp(UserToSignUp(
                            first_name: _nameController.text.split(" ").first,
                            last_name: _nameController.text.split(" ").last,
                            email: _emailController.text,
                            phone_number: _phoneController.text,
                            password: _passwordController.text,
                          ));
                        }
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
                        "already_have_an_account",
                        style: AppTheme.thinTextStyle,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.loginPage);
                        },
                        child: const LocalizedText(
                          "sign_in",
                          style: AppTheme.buttonLabelStyle2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Obx(() =>
            ModalProgressHUD(inAsyncCall: _authController.status.isLoading))
      ],
    ));
  }

  Widget bottomspace() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text("Choose Profile Picture", style: AppTheme.titleStyle),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                icon: Icon(Icons.photo_camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              TextButton.icon(
                icon: Icon(Icons.photo_library),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
    Get.back();
  }
}
