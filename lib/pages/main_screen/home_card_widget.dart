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
                                      CircularProgressIndicator(),
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
                                  '₹ 500',
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
                                  '₹ 5000',
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
                                  '36',
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
                            'Smile Crowdfounding',
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
                        'This foundation will bring smile on their face',
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

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      Image(
                        image: NetworkImage(
                            'http://iphonedeveloperguide.com/oneinr/project1.jpg'),
                        fit: BoxFit.cover,
                        // color: Colors.black87,
                        // colorBlendMode: BlendMode.darken,
                      ),
                      Positioned(
                        // left: 20,
                        top: 20,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          elevation: 8.0,
                          child: Container(
                            // color: Colors.red,
                            height: 100,
                            width: 300,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Smile Crowdfounding',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // alignment: Alignment.bottomCenter,
                        height: 100,
                        color: Color(0xFF5dbcd2),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '₹ 500',
                                    style: TextStyle(color: Colors.white),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '₹ 5000',
                                    style: TextStyle(color: Colors.white),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '36',
                                    style: TextStyle(color: Colors.white),
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  onPressed: () {},
                                  child: Text(
                                    'founded',
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

//  return InkWell(
//     onTap: onPressed,
//     child: Card(
//       margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
//       elevation: 5.0,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: [
//             Container(
//               alignment: Alignment.centerLeft,
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CarouselSlider(
//                     options: CarouselOptions(height: 150.0),
//                     items: [1, 2, 3].map((i) {
//                       return Builder(
//                         builder: (BuildContext context) {
//                           return FutureBuilder(
//                             future: sendImageInBytes(
//                                 imageUrl: selectedModel.mainImageURL),
//                             //  initialData: InitialData,
//                             builder: (BuildContext context,
//                                 AsyncSnapshot snapshot) {
//                               if (snapshot.hasData) {
//                                 return Image.memory(snapshot.data);
//                               } else {
//                                 // return Text('a');
//                                 return CachedNetworkImage(
//                                   imageUrl: selectedModel.mainImageURL,
//                                   imageBuilder: (context, imageProvider) =>
//                                       Container(
//                                     height: 150,
//                                     decoration: BoxDecoration(
//                                       color: Colors.red,
//                                       image: DecorationImage(
//                                           image: imageProvider,
//                                           fit: BoxFit.cover,
//                                           colorFilter: ColorFilter.mode(
//                                               Colors.red,
//                                               BlendMode.colorBurn)),
//                                     ),
//                                   ),
//                                   placeholder: (context, url) =>
//                                       CircularProgressIndicator(),
//                                   errorWidget: (context, url, error) =>
//                                       Icon(Icons.error),
//                                 );
//                               }
//                             },
//                           );
//                         },
//                       );
//                     }).toList(),
//                   ),

//                   Text(
//                     "${selectedModel.mainImageURL ?? ''}",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0XFF5E5E5E),
//                     ),
//                   ),
//                   Text(
//                     "${selectedModel.collectedValue ?? ''}",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0XFF5E5E5E),
//                     ),
//                   ),
//                   // Text(
//                   //   "${selectedModel.aDD2 ?? ''}",
//                   //   style: TextStyle(
//                   //     fontFamily: 'Poppins',
//                   //     fontSize: 14,
//                   //     fontWeight: FontWeight.bold,
//                   //     color: Color(0XFF5E5E5E),
//                   //   ),
//                   // ),
//                   Text(
//                     "${selectedModel.endDate ?? ''}",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0XFF5E5E5E),
//                     ),
//                   ),
//                   Text(
//                     "${selectedModel.startDate ?? ''}",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0XFF5E5E5E),
//                     ),
//                   ),
//                   Text(
//                     "${selectedModel.title ?? ''}",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0XFF5E5E5E),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
