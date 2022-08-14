import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petapp/app/features/wiki/controller/tabbarcontroller.dart';
import 'package:petapp/app/features/wiki/pages/animals.dart';
import 'package:petapp/app/features/wiki/pages/biology.dart';
import 'package:petapp/app/features/wiki/pages/foryou.dart';
import 'package:petapp/app/features/wiki/pages/pets.dart';
import 'package:petapp/app/widgets/textwidget.dart';

class WikiPage extends StatelessWidget {
  WikiPage({Key? key}) : super(key: key);
  TabBarSelectionController tabBarSelectionController =
      Get.put(TabBarSelectionController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarSelectionController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: SizedBox(
            height: 30,
            child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    tabBarSelectionController.selectstate(0);
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        color: tabBarSelectionController.state == 0
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextWidget(
                        name: "FOR YOU",
                        color: tabBarSelectionController.state == 0
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    tabBarSelectionController.selectstate(1);
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        color: tabBarSelectionController.state == 1
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextWidget(
                        name: "ANIMALS",
                        color: tabBarSelectionController.state == 1
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    tabBarSelectionController.selectstate(2);
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        color: tabBarSelectionController.state == 2
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextWidget(
                        name: "BIOLOGY",
                        color: tabBarSelectionController.state == 2
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    tabBarSelectionController.selectstate(3);
                  },
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                        color: tabBarSelectionController.state == 3
                            ? Colors.black
                            : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: TextWidget(
                        name: "PETS",
                        color: tabBarSelectionController.state == 3
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: tabBarSelectionController.state == 0
            ? ForYou()
            : tabBarSelectionController.state == 1
                ? Animals()
                : tabBarSelectionController.state == 2
                    ? Biology()
                    : Pets(),
      );
    });
  }
}
