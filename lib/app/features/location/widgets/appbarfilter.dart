import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petapp/app/consts/uiconstants.dart';
import 'package:petapp/app/features/location/controller/filtercontroller.dart';
import 'package:petapp/app/widgets/textwidget.dart';

class AppBarFilter extends StatelessWidget {
  AppBarFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          filterprice(),
          SizedBox(
            width: 10,
          ),
          filterdistance(),
          SizedBox(
            width: 10,
          ),
          filtercomments()
        ],
      ),
    );
  }
}

FilterContoller filterContoller = Get.find();
filterprice() {
  Size size = Get.size;
  return Container(
    width: 70,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: GetBuilder<FilterContoller>(builder: (cont) {
      return Center(
        child: DropdownButton<double>(
          items: <double>[1, 2, 3, 4].map((double value) {
            return DropdownMenuItem<double>(
              value: filterContoller.selectedprice,
              child: TextWidget(
                name: value.toString(),
                color: Colors.red,
              ),
            );
          }).toList(),
          hint: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget(
              name: "Price",
              color: Colors.red,
              fontsize: 10,
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.red,
          ),
          iconSize: 15,
          underline: Container(
            height: 1,
            color: Colors.transparent,
          ),
          isExpanded: true,
          onChanged: (value) {
            filterContoller.updateprice(value!);
          },
        ),
      );
    }),
  );
}

filterdistance() {
  Size size = Get.size;
  return Container(
    width: 80,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: GetBuilder<FilterContoller>(builder: (cont) {
      return DropdownButton<double>(
        items: <double>[1, 2, 3, 4].map((double value) {
          return DropdownMenuItem<double>(
            value: filterContoller.selecteddistance,
            child: TextWidget(
              name: value.toString(),
              color: Colors.red,
            ),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextWidget(
            name: "Distance",
            color: Colors.red,
            fontsize: 10,
          ),
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.red,
        ),
        iconSize: 15,
        underline: Container(
          height: 1,
          color: Colors.transparent,
        ),
        isExpanded: true,
        onChanged: (value) {
          filterContoller.updatedistance(value!);
        },
      );
    }),
  );
}

filtercomments() {
  Size size = Get.size;
  return Container(
    width: 80,
    height: 30,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: GetBuilder<FilterContoller>(builder: (cont) {
      return DropdownButton<double>(
        items: <double>[1, 2, 3, 4].map((double value) {
          return DropdownMenuItem<double>(
            value: filterContoller.selectedcomment,
            child: TextWidget(
              name: value.toString(),
              color: Colors.red,
            ),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextWidget(
            name: "Comments",
            color: Colors.red,
            fontsize: 10,
          ),
        ),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.red,
        ),
        iconSize: 15,
        underline: Container(
          height: 1,
          color: Colors.transparent,
        ),
        isExpanded: true,
        onChanged: (value) {
          filterContoller.updatecomments(value!);
        },
      );
    }),
  );
}
