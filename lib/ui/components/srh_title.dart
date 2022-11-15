import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/image_holder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SrhTitle extends StatelessWidget {
  final String name;
  final Srh? srh;
  final String description;
  final String? imageUrl;
  final Function()? onTap;
  const SrhTitle({
    Key? key,
    required this.srh,
    required this.name,
    required this.description,
    this.onTap,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.all(10),
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                ImageHolder(
                  path: imageUrl,
                  height: 107,
                  width: 65,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(name,
                          style: AppTheme.titleStyle2.copyWith(fontSize: 16)),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(description,
                          style: AppTheme.greySubtitleStyle
                              .copyWith(fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
