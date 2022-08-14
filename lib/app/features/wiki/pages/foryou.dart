import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petapp/app/widgets/textwidget.dart';

class ForYou extends StatefulWidget {
  const ForYou({Key? key}) : super(key: key);

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou>
    with AutomaticKeepAliveClientMixin<ForYou> {
  @override
  bool get wantKeepAlive => true;
  Widget build(BuildContext context) {
    Size size = Get.size;
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width,
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: TextField(
                // controller: emailController,
                decoration: InputDecoration(
                    hintText: "Search ",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(30)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
          ),
          SizedBox(
            width: 9 * size.width / 10,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black45,
                  thickness: 1,
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 130,
                  width: 9 * size.width / 10,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey),
                                      child: Icon(
                                        Icons.people,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    TextWidget(name: "Furkan Akgün")
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                  name: "Lorem Ipsum 3 Minures Read",
                                  fontsize: 13,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                  name: "June 25, 2022",
                                  fontsize: 10,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextWidget(
                                  name: "Selected For You",
                                  fontsize: 9,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 90,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.ios_share,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  TextWidget(
                                    name: "Share",
                                    color: Colors.grey,
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
