import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimap_interview_task/api/api.dart';
import 'package:nimap_interview_task/controllers/home_controller.dart';
import 'package:nimap_interview_task/models/record_model.dart';
import 'package:nimap_interview_task/pages/widgets/no_internet_screen/shimmer_list.dart';
import 'package:path_provider/path_provider.dart';

import 'home_card_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getJsonDataFromStatus();
    // homeController.getAllImageDataLinkAnddownload(context: context);

    // Api().downloadAllImage();
  }

  getJsonDataFromStatus() async {
    // there is an error on fetching the data so i am using from asset
    String data = await DefaultAssetBundle.of(context)
        .loadString("json_data/json_data.json");
    final jsonResult = json.decode(data);
    return jsonResult["data"]["Records"];
  }

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() {
      return showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('You want to close the app'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () {
                    exit(0);
                    // Repository()
                    //     .lastUpdatedMobile(userId: widget.strUser)
                    //     .then((value) {
                    //   Navigator.of(context).pop(true);

                    // });
                  },
                  child: new Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF40809c),
          title: Text('Nimap Coding Test'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          // future: homeController.fetchAllRecordsFromApi(),
          future: getJsonDataFromStatus(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // print(snapshot);
            if (!snapshot.hasData) {
              return ShimmerList();
            } else {
              print(snapshot.data);

              // return Text(snapshot.data[0]["title"]);
              return ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  RecordModel tempLocAation =
                      RecordModel.fromJson(snapshot.data[i]);

                  // return Text(tempLocAation.id.toString());

                  return HomeCardWidget(
                    onPressed: () {},
                    selectedModel: tempLocAation,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
