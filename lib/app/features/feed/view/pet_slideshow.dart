import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipe_cards/draggable_card.dart';

import '../../../consts/textconstant.dart';
import '../../../widgets/appBarWidget.dart';
import '../../../widgets/buttonwidgets.dart';

class PetSlideShow extends StatefulWidget {
  const PetSlideShow({Key? key}) : super(key: key);

  @override
  State<PetSlideShow> createState() => _PetSlideShowState();
}

class _PetSlideShowState extends State<PetSlideShow> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink"
  ];
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink
  ];
  List<String> _urls = [
    "assets/img/pet4.jpg",
    "assets/img/pet1.jpg",
    "assets/img/pet2.jpg",
    "assets/img/pet3.jpg",
    "assets/img/pet4.jpg",
    "assets/img/pet5.jpg",
    "assets/img/pet2.jpg",
  ];

  @override
  void initState() {
    for (int i = 0; i < 6; i++) {
      _swipeItems.add(SwipeItem(
          content:
              Content(text: _names[i], color: _colors[i], photoUrl: _urls[i]),
          likeAction: () {
            Get.snackbar(
              "Liked ${_names[i]}",
              "",
              backgroundColor: Colors.redAccent,
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              duration: Duration(milliseconds: 1000),
              isDismissible: true,
              margin: EdgeInsets.all(15),
              forwardAnimationCurve: Curves.easeOutBack,
            );
          },
          nopeAction: () {
            // Get.snackbar(
            //   "Nope ${_names[i]}",
            //   "",
            //   backgroundColor: Colors.redAccent,
            //   snackPosition: SnackPosition.BOTTOM,
            //   colorText: Colors.white,
            //   duration: Duration(milliseconds: 1000),
            //   isDismissible: true,
            //   margin: EdgeInsets.all(15),
            //   forwardAnimationCurve: Curves.easeOutBack,
            // );
          },
          superlikeAction: () {
            Get.snackbar(
              "Super Liked ${_names[i]}",
              "",
              backgroundColor: Colors.redAccent,
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              duration: Duration(milliseconds: 1000),
              isDismissible: true,
              margin: EdgeInsets.all(15),
              forwardAnimationCurve: Curves.easeOutBack,
            );
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            "Discover your buddies",
            style: TextStyle(color: Colors.red),
          ),

          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_a_photo_rounded,
                color: Colors.red,
                size: 32,
              ),
              tooltip: 'Add',
              onPressed: () {
                
              },
            ), //IconButton
          ], //<Widget>[]
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.red,
              size: 32,
            ),
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ), //IconButton
          brightness: Brightness.dark,
        ),
        body: Container(
            child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  // color: _swipeItems[index].content.color,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_swipeItems[index].content.photoUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Text(
                  //   _swipeItems[index].content.text,
                  //   style: TextStyle(fontSize: 100),
                  // ),
                );
              },
              onStackFinished: () {
                Get.snackbar(
                  "Stream is finished",
                  "",
                  backgroundColor: Colors.redAccent,
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
                  duration: Duration(milliseconds: 1000),
                  isDismissible: true,
                  margin: EdgeInsets.all(15),
                  forwardAnimationCurve: Curves.easeOutBack,
                );
                Navigator.pop(context);
              },
              itemChanged: (SwipeItem item, int index) {
                // print("item: ${item.content.text}, index: $index");
              },
              upSwipeAllowed: true,
              fillSpace: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              outlinedButtonRed("Like", () {
                _matchEngine!.currentItem?.like();
              }, Icons.favorite_border, 18),
              // ElevatedButton(
              //     onPressed: () {
              //       _matchEngine!.currentItem?.like();
              //     },
              //     child: Text("Like")),
              outlinedButtonRed("Super Like", () {
                _matchEngine!.currentItem?.superLike();
              }, Icons.favorite, 18),
              outlinedButtonRed("Next", () {
                _matchEngine!.currentItem?.nope();
              }, Icons.navigate_next, 22),
            ],
          )
        ])));
  }
}

class Content {
  final String? text;
  final Color? color;
  final String? photoUrl;
  Content({
    this.text,
    this.color,
    this.photoUrl,
  });
}
