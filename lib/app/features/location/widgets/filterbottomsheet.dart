import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Center(
                    child: Icon(
                      Icons.clear,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
