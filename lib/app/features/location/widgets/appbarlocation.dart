import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:petapp/app/features/location/widgets/filterbottomsheet.dart';
import 'package:petapp/app/widgets/textwidget.dart';

AppBar appbarlocation() {
  Size size = Get.size;
  return AppBar(
    toolbarHeight: 40,
    actions: [
      GestureDetector(
        onTap: () {
          Get.bottomSheet(FilterBottomSheet());
        },
        child: Icon(
          FontAwesomeIcons.filterCircleXmark,
          color: Colors.red,
          size: 20,
        ),
      ),
      SizedBox(
        width: 10,
      )
    ],
    elevation: 0,
    titleSpacing: 0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Container(
      width: size.width / 2.5,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.redAccent.shade100,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.locationDot,
            size: 16,
          ),
          SizedBox(
            width: 3,
          ),
          TextWidget(
            name: "Ankara Turkey",
            color: Colors.red,
            fontsize: 11,
          ),
        ],
      ),
    ),
  );
}
