import 'package:flutter/material.dart';
import 'package:petapp/app/consts/textconstant.dart';

AppBar header() {
  return AppBar(
    title: Text("PetApp"),

    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.notifications_none_outlined,
          color: Colors.red,
          size: 32,
        ),
        tooltip: 'Notifications',
        onPressed: () {},
      ), //IconButton
      IconButton(
        icon: Icon(
          Icons.add_circle_outline,
          color: Colors.red,
          size: 32,
        ),
        tooltip: 'Add post',
        onPressed: () {},
      ), //IconButton
    ], //<Widget>[]
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.red,
        size: 32,
      ),
      tooltip: 'Search',
      onPressed: () {},
    ), //IconButton
    brightness: Brightness.dark,
  ); //AppBar
}

AppBar headerPetStream() {
  return AppBar(
    title: Text(
      "Discover your buddies",
      style: TextStyle(color: Colors.red),
    ),

    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.red,
          size: 32,
        ),
        tooltip: 'Notifications',
        onPressed: () {
        
        },
      ), //IconButton
      IconButton(
        icon: Icon(
          Icons.add_circle_outline,
          color: Colors.red,
          size: 32,
        ),
        tooltip: 'Add post',
        onPressed: () {},
      ), //IconButton
    ], //<Widget>[]
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.red,
        size: 32,
      ),
      tooltip: 'Search',
      onPressed: () {},
    ), //IconButton
    brightness: Brightness.dark,
  ); //AppBar
}

AppBar headerProfile() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    // leading: GestureDetector(
    //   onTap: () {/* Write listener code here */},
    //   child: Icon(
    //     Icons.arrow_back_ios_new,
    //     color: Colors.red, // add custom icons also
    //   ),
    // ),
    actions: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.menu,
              color: Colors.red, // add custom icons also
            ),
          )),
    ],
  );
}
