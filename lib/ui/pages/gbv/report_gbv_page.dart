import 'dart:io';

import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/controllers/gbv_controller.dart';
import 'package:bertucanfrontend/ui/widgets/custom_loader.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/image_holder.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReportGbvPage extends StatefulWidget {
  ReportGbvPage({Key? key}) : super(key: key);

  @override
  State<ReportGbvPage> createState() => _ReportGbvPageState();
}

class _ReportGbvPageState extends State<ReportGbvPage> {
  TextEditingController messageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  AuthController _authController = Get.find();
  GbvController controller = Get.find();

  final _formKey = GlobalKey<FormState>();
  String? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppTheme.creamyBackground,
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Center(
                            child: LocalizedText("back",
                                style: AppTheme.titleStyle3)),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
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
                        const SizedBox(width: 10),
                        Text(
                          "${_authController.user.first_name ?? ""} ${_authController.user.last_name ?? ""}",
                          style: AppTheme.titleStyle
                              .copyWith(color: AppTheme.textBlack),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    LocalizedText(
                      "report_abuse",
                      style: AppTheme.titleStyle
                          .copyWith(color: AppTheme.textBlack),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: CustomTextField(
                        decoration: AppTheme.purpleBoxDecoration(),
                        label: 'phone_number',
                        hintText: 'enter_phone_number',
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              !RegExp(r"^(?:\+2519|09)[0-9]{8}$")
                                  .hasMatch(value)) {
                            return "invalid_phone".tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: CustomTextField(
                          decoration: AppTheme.purpleBoxDecoration(),
                          label: 'place',
                          hintText: 'enter_place',
                          controller: placeController),
                    ),
                    Container(
                      decoration: AppTheme.purpleBoxDecoration(),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 30),
                      child: TextFormField(
                        controller: messageController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "report_abuse_hint",
                            hintStyle: AppTheme.hintTextStyle),
                        maxLines: 8,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_your_message'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: AppTheme.purpleBoxDecoration(),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LocalizedText(
                            "upload_file",
                            style: AppTheme.hintTextStyle,
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomspace()));
                            },
                            icon: const Icon(
                              Icons.upload_rounded,
                              color: AppTheme.hintGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    file != null
                        ? Container(
                            decoration: AppTheme.textFieldDecoration2(),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    file!.split("/").last,
                                    style: AppTheme.hintTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      file = null;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppTheme.hintGrey,
                                  ),
                                )
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: RoundedButton(
                        text: "send",
                        isEnabled: !controller.status.isLoading,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            GbvReport report = GbvReport(
                                message: messageController.text,
                                file: file,
                                abuse_types_id: '1',
                                gbv_center:
                                    controller.selectedGbv.id.toString(),
                                contact_address: placeController.text,
                                contact_phone_number: phoneController.text);
                            await controller.reportGbv(report);
                          }
                        }),
                  ),
                )
              ]),
        ),
      ),
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
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        file = pickedFile.path;
      });
      Get.back();
    } else {
      toast("error", "image_not_taken");
    }
  }
}
