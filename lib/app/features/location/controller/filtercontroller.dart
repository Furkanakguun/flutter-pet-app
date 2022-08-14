import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterContoller extends GetxController {
  double? selectedprice = 1;
  double? selecteddistance = 1;
  double? selectedcomment = 1;

  updateprice(double newprice) {
    selectedprice = newprice;
    update();
  }

  updatedistance(double newdistance) {
    selecteddistance = newdistance;
    update();
  }

  updatecomments(double newcomment) {
    selectedcomment = newcomment;
    update();
  }
}
