import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimap_interview_task/api/api.dart';
import 'package:nimap_interview_task/models/record_model.dart';
import 'package:nimap_interview_task/repository/repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  // var listOfAllRoom;

  // ApiModel data;

  // Future fetchAllRecordsFromApi() async {
  //   Completer completer = Completer();
  //   Repository repository = Repository();
  //   return await repository.fetchAllRecordsFromApi();
  // }

  getAllImageDataLinkAnddownload({@required context}) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("json_data/json_data.json");
    final jsonResult = json.decode(data);

    var snapshot = jsonResult["data"]["Records"];
    List<String> listOfImage = List<String>();
    List<RecordModel> tempLocAation = List<RecordModel>();
    listOfImage.clear();
    tempLocAation.clear();
    snapshot.forEach((json) {
      tempLocAation.add(RecordModel.fromJson(json));
    });

    tempLocAation.forEach((element) {
      listOfImage.add(element.mainImageURL);
    });

    Api().downloadCompalsaryFolderImage(imageUrlList: listOfImage);
  }
}
