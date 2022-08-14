import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarSelectionController extends GetxController {
  int state = 0;

  void selectstate(int newstate) {
    state = newstate;
    update();
  }
}
