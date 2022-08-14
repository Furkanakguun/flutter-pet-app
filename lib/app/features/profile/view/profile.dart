import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:petapp/app/consts/textconstant.dart';
import 'package:petapp/app/features/profile/view/pet_profile.dart';
import 'package:petapp/app/widgets/appBarWidget.dart';
import 'package:petapp/app/widgets/textwidget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Padding buildDrawerItem(IconData icon, String title, Function fun) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, top: 6),
      child: GestureDetector(
        child: Container(
          height: 40,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      // Icon(
                      //   icon,
                      //   color: Colors.white,
                      //   size: 30,
                      // ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        title,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 1,
                    color: Colors.red,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white, // Drawer rengini buradan değiştirebilirsiniz
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Expanded(
              child: ListView(padding: EdgeInsets.zero, children: [
                //Settings
                buildDrawerItem(Icons.settings, "Settings", () => {}),
                //New User Guide
                buildDrawerItem(Icons.book, "New User Guide", () => {}),
                // FAQ Contact Us
                buildDrawerItem(
                    Icons.question_answer, "FAQ/Contact Us", () => {}),
                //Terms of Service
                buildDrawerItem(Icons.bookmark, "Terms of Service", () => {}),
                //Privacy Policy
                buildDrawerItem(
                    Icons.library_books_rounded, "Privacy Policy", () => {}),
                //Logout
                buildDrawerItem(Icons.logout, "Logout", () => {}),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: buildDrawer(),
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
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
          Builder(builder: (c) {
            return Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(c).openEndDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.red, // add custom icons also
                  ),
                ));
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TextWidget(name: "Profile"),
            Container(
              height: 325,
              width: queryData.size.width,
              color: Colors.white,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: "Hello ",
                          style: pageTitleStyle,
                          children: [
                            TextSpan(
                                // recognizer: TapGestureRecognizer()
                                //   ..onTap = () => Get.to(() => SignUpPage()),
                                text: "Merve",
                                style: pageTitleStyleBold)
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        Text(
                          "Ankara",
                          style: pageSubTitleStyleBold,
                        ),
                        const Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 5,
                        ),
                        Text(
                          "Turkey",
                          style: pageSubTitleStyle,
                        )
                      ])),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Container(
                    height: 1,
                    color: Colors.grey,
                    width: 200,
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        RichText(
                          text: TextSpan(
                              text: "Mother of ",
                              style: pageSubTitleStyle,
                              children: [
                                TextSpan(
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () => Get.to(() => PetProfile()),
                                    text: "Anna ",
                                    style: pageSubTitleStyleBold)
                              ]),
                        ),
                        const Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 5,
                        ),
                        Text(
                          " 28 years old",
                          style: pageSubTitleStyle,
                        )
                      ])),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              width: queryData.size.width,
              color: Colors.grey[100],
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "My Pets",
                        style: pageTitleStyleBold,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: queryData.size.width,
                  height: 300,
                  // color: Colors.grey,
                  color: Colors.transparent,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      //your widget items here
                      GestureDetector(
                        onTap: () {
                          pushNewScreen(context, screen: PetProfile());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Container(
                            width: 180,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              image: DecorationImage(
                                image: AssetImage("assets/img/pet3.jpg"),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 10.0,
                                  bottom: 10.0,
                                  child: Container(
                                      width: queryData.size.width - 50,
                                      child: Text("Anna",
                                          style: pageTitleStyleWhiteBold)),
                                ),
                                // Positioned(
                                //   right: 0.0,
                                //   bottom: 0.0,
                                //   child: Icon(Icons.star),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //       "https://firebasestorage.googleapis.com/v0/b/petapp-f989b.appspot.com/o/cat.jpg?alt=media&token=fc433f7c-a79e-4463-8178-7cdf853f6cd1"),
                            //   fit: BoxFit.fitHeight,
                            //   alignment: Alignment.topCenter,
                            // ),
                          ),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_rounded,
                                color: Colors.grey[300],
                                size: 120,
                              ),
                              Text(
                                'Add another pet',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //       "https://firebasestorage.googleapis.com/v0/b/petapp-f989b.appspot.com/o/cat.jpg?alt=media&token=fc433f7c-a79e-4463-8178-7cdf853f6cd1"),
                            //   fit: BoxFit.fitHeight,
                            //   alignment: Alignment.topCenter,
                            // ),
                          ),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_rounded,
                                color: Colors.grey[300],
                                size: 120,
                              ),
                              Text(
                                'Add another pet',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
