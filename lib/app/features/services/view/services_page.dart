import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petapp/app/features/location/view/location_page.dart';
import 'package:petapp/app/widgets/textwidget.dart';

class ServicesPage extends StatelessWidget {
  ServicesPage({Key? key}) : super(key: key);
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 200);
  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.red,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.add,
            color: Colors.red,
            size: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: TextWidget(
          name: "Hello Merve, \nlet us help you",
          color: Colors.red,
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: size.height - 200,
            toolbarHeight: 10,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                height: 30,
                width: size.width,
                child: Center(
                  child: SizedBox(
                    width: 9 * size.width / 10,
                    child: TextWidget(
                      name: "Services",
                      color: Colors.grey,
                      fontsize: 20,
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
                      zoom: 10,
                    ),
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                      new Factory<OneSequenceGestureRecognizer>(
                        () => new EagerGestureRecognizer(),
                      ),
                    ].toSet(),
                    onMapCreated: (controller) {
                      googleMapController = controller;
                    }),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 210,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.red,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                    bottom: 0,
                                    child: SizedBox(
                                      height: 150,
                                      child: Image.asset(
                                        "assets/img/pet.png",
                                        fit: BoxFit.contain,
                                      ),
                                    )),
                                Positioned(
                                    top: 20,
                                    left: 20,
                                    child: TextWidget(
                                      name: "Nearby Clinics \n and Hospitals",
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.blue,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        bottom: 5,
                                        right: 0,
                                        child: SizedBox(
                                          height: 60,
                                          child: Image.asset(
                                            "assets/img/shop.png",
                                            fit: BoxFit.contain,
                                          ),
                                        )),
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: TextWidget(
                                          name: "Store",
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.green,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        bottom: 0,
                                        right: 5,
                                        child: SizedBox(
                                          height: 95,
                                          child: Image.asset(
                                            "assets/img/key.png",
                                            fit: BoxFit.contain,
                                          ),
                                        )),
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: TextWidget(
                                          name: "Pet Hotel",
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(LocationPage());
                              },
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.cyan,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: SizedBox(
                                          height: 70,
                                          child: Image.asset(
                                            "assets/img/dog.png",
                                            fit: BoxFit.contain,
                                          ),
                                        )),
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: TextWidget(
                                          name: "Walking with \n Friend",
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.amber,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: SizedBox(
                                        height: 60,
                                        child: Image.asset(
                                          "assets/img/taxi.png",
                                          fit: BoxFit.contain,
                                        ),
                                      )),
                                  Positioned(
                                      top: 20,
                                      left: 20,
                                      child: TextWidget(
                                        name: "Pet Taxi",
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
