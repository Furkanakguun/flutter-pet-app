import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petapp/app/features/location/controller/filtercontroller.dart';
import 'package:petapp/app/features/location/widgets/appbarfilter.dart';
import 'package:petapp/app/features/location/widgets/appbarlocation.dart';
import 'package:petapp/app/features/location/widgets/filterbottomsheet.dart';
import 'package:petapp/app/widgets/shadowwidgets.dart';
import 'package:petapp/app/widgets/textwidget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class LocationPage extends StatelessWidget {
  LocationPage({Key? key}) : super(key: key);
  FilterContoller filterContoller = Get.put(FilterContoller());

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appbarlocation(),
      body: Scaffold(
          appBar: AppBar(
              toolbarHeight: 35,
              elevation: 3,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: AppBarFilter()),
          body: Column(
            children: [
              Expanded(
                child: GoogleMap(
                    zoomGesturesEnabled: true,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(39.925533, 32.866287),
                      zoom: 15,
                    ),
                    onMapCreated: (controller) {}),
              ),
              GestureDetector(
                onTap: () {
                  showAsBottomSheet(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  height: 70,
                  width: size.width,
                  child: Center(
                    child: SizedBox(
                      width: 9 * size.width / 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 50,
                            height: 10,
                            child: Divider(height: 5, thickness: 4),
                          ),
                          TextWidget(
                            name: "250+ Veterinary",
                            color: Colors.red,
                            fontsize: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )

          /*CustomScrollView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: size.height - 200,
              toolbarHeight: 10,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  height: 50,
                  width: size.width,
                  child: Center(
                    child: SizedBox(
                      width: 9 * size.width / 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 10,
                            child: Divider(height: 5, thickness: 4),
                          ),
                          TextWidget(
                            name: "250+ Veterinary",
                            color: Colors.red,
                            fontsize: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: GestureDetector(
                  onVerticalDragStart: (details) {},
                  child: GoogleMap(
                      zoomGesturesEnabled: true,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: false,
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(39.925533, 32.866287),
                        zoom: 15,
                      ),
                      gestureRecognizers: Set()
                        ..add(Factory<PanGestureRecognizer>(
                            () => PanGestureRecognizer()))
                        ..add(Factory<ScaleGestureRecognizer>(
                            () => ScaleGestureRecognizer()))
                        ..add(Factory<TapGestureRecognizer>(
                            () => TapGestureRecognizer()))
                        ..add(Factory<VerticalDragGestureRecognizer>(
                            () => VerticalDragGestureRecognizer())),
                      onMapCreated: (controller) {}),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowcard(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 250,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://ankarasehir.saglik.gov.tr/Resim/354647/0/ankara-sehir-hastanesi-4-buyukjpg.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Container(
                                      height: 100,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            name: "Ankara Pet Hospital",
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 14,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextWidget(
                                            name: "Ankara Caddesi No:172",
                                            color: Colors.black,
                                            fontsize: 11,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                  right: 20,
                                  bottom: 85,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: shadowdown(),
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.heart,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  right: 20,
                                  bottom: 20,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.ios_share,
                                        color: Colors.grey,
                                        size: 17,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),*/
          ),
    );
  }

  void showAsBottomSheet(BuildContext context) async {
    Size size = Get.size;
    final result = await showSlidingBottomSheet(context, builder: (context) {
      return SlidingSheetDialog(
        elevation: 0,
        cornerRadius: 40,
        backdropColor: Colors.transparent,
        snapSpec: const SnapSpec(
          snap: true,
          initialSnap: 0.7,
          snappings: [0.4, 0.9],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        headerBuilder: (context, statet) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            height: 50,
            width: size.width,
            child: Center(
              child: SizedBox(
                width: 9 * size.width / 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 10,
                      child: Divider(height: 5, thickness: 4),
                    ),
                    TextWidget(
                      name: "250+ Veterinary",
                      color: Colors.red,
                      fontsize: 16,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        builder: (context, state) {
          return Column(children: [
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: shadowcard(),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 250,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://ankarasehir.saglik.gov.tr/Resim/354647/0/ankara-sehir-hastanesi-4-buyukjpg.png"),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      name: "Ankara Pet Hospital",
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 14,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextWidget(
                                      name: "Ankara Caddesi No:172",
                                      color: Colors.black,
                                      fontsize: 11,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                            right: 20,
                            bottom: 85,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: shadowdown(),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                            )),
                        Positioned(
                            right: 20,
                            bottom: 20,
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.ios_share,
                                  color: Colors.grey,
                                  size: 17,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ]);
        },
      );
    });

    print(result); // This is the result.
  }
}
