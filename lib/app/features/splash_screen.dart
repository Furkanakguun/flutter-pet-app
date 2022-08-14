

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: Center(
        child: Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.pink,
          ),
        ),
      ),
    );
  }
}