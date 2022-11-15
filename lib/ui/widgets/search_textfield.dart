import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  const SearchTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: AppTheme.normalTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: translate(hintText),
          hintStyle:
              AppTheme.greySubtitleStyle.copyWith(fontWeight: FontWeight.w400),
          prefixIcon: const Icon(Icons.search),
        ),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
