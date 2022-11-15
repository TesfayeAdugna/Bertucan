import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/dialogs/change_passcode_dialog.dart';
import 'package:bertucanfrontend/ui/components/dialogs/change_password_dialog.dart';
import 'package:bertucanfrontend/ui/components/dialogs/edit_profile_dialog.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/custom_dialog.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/image_holder.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthController _authController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authController.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.peachBackground,
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 15, top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
                          child: LocalizedText('profile',
                              style: AppTheme.titleStyle2),
                        ),
                        SizedBox(width: 20),
                        if (_authController.user.id != -1)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: InkWell(
                                onTap: () {
                                  Get.dialog(EditProfileDialog());
                                },
                                child: const Icon(Icons.edit,
                                    color: AppTheme.primaryColor)),
                          )
                        else
                          SizedBox(),
                      ],
                    ),
                    _authController.user.id != -1
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  child: ImageHolder(
                                    path: _authController.user.profile_picture,
                                    height: 107,
                                    width: 65,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(59),
                                    color: const Color(0xFFFEEFF2),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LocalizedText(
                                              "name :",
                                              style: AppTheme.titleStyle2
                                                  .copyWith(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.46,
                                              padding:
                                                  const EdgeInsets.only(top: 2),
                                              child: Text(
                                                  "${_authController.user.first_name ?? ""} ${_authController.user.last_name ?? ""}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      AppTheme.normalTextStyle),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LocalizedText(
                                              "email : ",
                                              style: AppTheme.titleStyle2
                                                  .copyWith(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 13,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.46,
                                              padding:
                                                  const EdgeInsets.only(top: 2),
                                              child: Text(
                                                "${_authController.user.email}",
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    AppTheme.normal2TextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        : Center(
                            child: Column(
                              children: [
                                LocalizedText(
                                  'you_are_not_logged_in',
                                  style: AppTheme.boldTitle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                    child: Container(
                                      decoration: AppTheme
                                          .primaryColoredRoundedButtonDecoration(),
                                      child: LocalizedText(
                                        'login',
                                        style: AppTheme.normal2TextStyle
                                            .copyWith(color: Colors.white),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                    ),
                                    onTap: () {
                                      Get.toNamed(Routes.loginPage);
                                    })
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Color.fromARGB(255, 203, 201, 201),
                      thickness: 0.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 10, bottom: 25, top: 40),
                      child: LocalizedText('general_setting',
                          style: AppTheme.titleStyle2),
                    ),
                    singleTile(
                      onTap: () {
                        Get.dialog(
                          SetPassCode(),
                        );
                      },
                      iconData: Icons.lock,
                      label: _authController.getPasscode() != null
                          ? 'change_passcode'
                          : 'passcode_setting',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _authController.user.id != -1
                        ? singleTile(
                            onTap: () {
                              Get.dialog(
                                ChangePassword(),
                                barrierColor: Colors.grey.withOpacity(0.1),
                              );
                            },
                            iconData: Icons.password,
                            label: 'change_password',
                          )
                        : SizedBox(),
                    singleTile(
                      iconData: Icons.language,
                      label: 'language',
                      extra: DropdownButton<Locale>(
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _authController.user.id != -1
                        ? Column(
                            children: [
                              singleTile(
                                onTap: () {
                                  Get.dialog(CustomDialog(
                                    title: 'logout',
                                    content: [
                                      const LocalizedText(
                                          'are_you_sure_you_want_to_logout?'),
                                    ],
                                    onConfirm: () {
                                      _authController.logout();
                                    },
                                  ));
                                },
                                iconData: Icons.logout_rounded,
                                label: 'logout',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              singleTile(
                                onTap: () {
                                  Get.dialog(
                                    CustomDialog(
                                      title: 'delete_account',
                                      content: const [
                                        LocalizedText(
                                            'are_you_sure_you_want_to_delete_your_account?'),
                                      ],
                                      onConfirm: () {
                                        _authController.deleteAccount();
                                      },
                                    ),
                                  );
                                },
                                iconData: Icons.delete,
                                label: 'delete_account',
                              ),
                            ],
                          )
                        : SizedBox()
                  ]),
            ),
          ),
        ));
  }

  Widget singleTile(
      {required IconData iconData,
      required String label,
      Function()? onTap,
      Widget? extra}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 35,
            color: AppTheme.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocalizedText(label, style: AppTheme.titleStyle3),
                extra ?? SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
