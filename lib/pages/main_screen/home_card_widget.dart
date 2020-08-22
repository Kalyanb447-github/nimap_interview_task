import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nimap_interview_task/models/record_model.dart';

class HomeCardWidget extends StatelessWidget {
  Future<Uint8List> sendImageInBytes({@required String imageUrl}) async {
    final ByteData imageData =
        await NetworkAssetBundle(Uri.parse("$imageUrl")).load("");
    final Uint8List bytes = imageData.buffer.asUint8List();

    return bytes;
  }

  const HomeCardWidget({
    @required this.selectedModel,
    @required this.onPressed,
    // @required this.position,
    // @required this.selectedIndex,
  });
  final Function onPressed;
  final RecordModel selectedModel;

  // final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .5,
      color: Colors.grey,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        overflow: Overflow.visible,
        children: [
          Container(
            alignment: Alignment.topCenter,
            // height: Get.height * .3,
            // color: Colors.green,
            child: Column(
              children: [
                Container(
                  height: Get.height * .3,
                  width: Get.width,
                  // child: Image(
                  //   image: NetworkImage(
                  //       'http://iphonedeveloperguide.com/oneinr/project1.jpg'),
                  //   fit: BoxFit.fitWidth,
                  //   // color: Colors.black87,
                  //   // colorBlendMode: BlendMode.darken,
                  // ),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: Get.height * .3,
                    ),
                    items: [1, 2, 3].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return FutureBuilder(
                            future: sendImageInBytes(
                                imageUrl: selectedModel.mainImageURL),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Image.memory(
                                  snapshot.data,
                                  fit: BoxFit.cover,
                                );
                              } else {
                                // return Text('a');
                                return CachedNetworkImage(
                                  imageUrl: selectedModel.mainImageURL,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                          colorFilter: ColorFilter.mode(
                                              Colors.red, BlendMode.colorBurn)),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      Image.asset('assets/no_image.png'),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                );
                              }
                            },
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: Get.height * .2,
                  color: Color(0xFF5dbcd2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₹ ${selectedModel.collectedValue ?? ''}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'founded',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${selectedModel.totalValue ?? ''}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Goals',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${selectedModel.endDate ?? ''}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Ends In',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                onPressed: () {},
                                child: Text(
                                  'PLEDGE',
                                  style: TextStyle(
                                    color: Color(0xFF376377),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 150,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: 8.0,
              child: Container(
                // color: Colors.red,
                height: 100,
                width: Get.width * .7,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            selectedModel.title ?? '',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),

                    ListTile(
                      title: Text(
                        selectedModel.shortDescription ?? '',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Text(
                    //         'This foundation will bring smile on their face',
                    //         style: TextStyle(
                    //             color: Colors.grey,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 150,
            child: Container(
              // color: Colors.red,
              height: 100,
              width: Get.width * .2,
              child: CircleAvatar(
                backgroundColor: Color(0xFF083c4a),
                child: Text(
                  '100 %',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
