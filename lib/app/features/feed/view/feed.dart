import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:petapp/app/features/feed/view/pet_slideshow.dart';
import 'package:petapp/app/widgets/appBarWidget.dart';

import '../../profile/view/pet_profile.dart';
import '../model/post.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: header(),
      body: SingleChildScrollView(
          controller: _scrollViewController,
          child: Column(children: [
            // Material Banner implementation
            const SizedBox(
              height: 15,
            ),
            petPhotoStream(queryData),

            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Post(
                    postId: "1",
                    imagePost: false,
                    questionPost: false,
                  );
                }),

            //Example Interactive post
            Post(
              postId: "1",
              imagePost: false,
              questionPost: true,
            ),
            SizedBox(
              height: 20,
            ),
          ])),
    );
  }

  Widget petPhotoStream(MediaQueryData queryData) {
    return GestureDetector(
      onTap: () {
        Get.to(PetSlideShow());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
            constraints: BoxConstraints.expand(
                height: 240.0, width: queryData.size.width),
            padding:
                const EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                      15.0) //                 <--- border radius here
                  ),
              image: DecorationImage(
                image: AssetImage('assets/img/pet1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: Container(
                    width: queryData.size.width - 50,
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                      ),
                      title: const Text(
                        'Name',
                        textScaleFactor: 1,
                        style: TextStyle(color: Colors.white),
                      ),
                      // trailing: Icon(Icons.done),
                      subtitle: Text(
                        'Mother of Anna',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        color: Colors.white,
                      ),
                      selected: true,
                      onTap: () {},
                    ),
                  ),
                ),
                // Positioned(
                //   right: 0.0,
                //   bottom: 0.0,
                //   child: Icon(Icons.star),
                // ),
              ],
            )),
      ),
    );
  }
}
