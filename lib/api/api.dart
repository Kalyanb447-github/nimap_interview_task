import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:nimap_interview_task/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:nimap_interview_task/models/record_model.dart';
import 'package:nimap_interview_task/models/record_model.dart';
import 'package:nimap_interview_task/models/record_model.dart';
import 'package:path_provider/path_provider.dart';

class Api {
  // String kepi_url = 'https://test.chatongo.in/testdata.json';

  Future getDataFromServer({@required url}) async {
    http.Response result;
    try {
      result = await http.get(kapi_url + '/' + url,
          headers: {"Content-type": "application/json"});

      if (result.statusCode == 200) {
        // return jsonDecode(result.body);
        return json.decode(result.body);
        // print(result.body);
        // return jsonDecode(result.body['data']);

//         Exception has occurred.
// FormatException (FormatException: Unexpected character (at line 108, character 14)
//              ]
//              ^
// )
      }
    } catch (e) {
      print(e);
      return;
    }
  }

  // Future downloadCompalsaryFolderImage(
  //     {@required List<String> imageUrlList}) async {
  //   Directory _appDocDir = await getExternalStorageDirectory();
  //   final Directory _appFile = Directory('${_appDocDir.path}');

  //   for (var i = 0; i < imageUrlList.length; i++) {
  //     File('${_appFile.path}/${imageUrlList[i]}').exists().then((value) async {
  //       print(value);
  //       !value
  //           ? await get(imageUrlList[i]).then((response) {
  //               if (response != null) {
  //                 // var filePathAndName = '${_appFile.path}/${imageUrlList[i]}';
  //                 var filePathAndName = '$i.jpg';
  //                 File(filePathAndName).writeAsBytesSync(response.bodyBytes);
  //                 print('compulsory saved image');
  //               }
  //             })
  //           // ignore: unnecessary_statements
  //           : null;
  //     });
  //   }

  //   return 'Saved Image';
  // }

  // Future downloadCompalsaryFolderImage2(
  //     {@required List<String> imageUrlList}) async {
  //   Directory _appDocDir = await getExternalStorageDirectory();
  //   final Directory _appFile = Directory('${_appDocDir.path}/');

  //   try {
  //     for (var i = 0; i < imageUrlList.length; i++) {
  //       File('/storage/emulated/0/Smartify/compulsory/${imageUrlList[i]}')
  //           .exists()
  //           .then((value) async {
  //         print(value);
  //         !value
  //             ? await get("${imageUrlList[i].toString()}").then((response) {
  //                 if (response != null) {
  //                   var filePathAndName =
  //                       '/storage/emulated/0/Smartify/compulsory' +
  //                           '/${imageUrlList[i].toString()}';
  //                   File(filePathAndName).writeAsBytesSync(response.bodyBytes);
  //                   print('compulsory saved image');
  //                 }
  //               })
  //             : null;
  //       });
  //     }

  //     return 'Saved Image';
  //   } catch (e) {
  //     print('Error saving image : $e');
  //     return 'not Saved Image';
  //   }
  // }

  downloadImage({@required List<String> imageUrlList}) async {
    // var url = "https://www.tottus.cl/static/img/productos/20104355_2.jpg";

    for (var i = 0; i < imageUrlList.length; i++) {
      ////check file already exist or not
      // File('/storage/emulated/0/Smartify/compulsory/${imageUrlList[i]}')
      //     .exists()
      //     .then((value) {});

      try {
        var response = await http.get(imageUrlList[i]);
        var documentDirectory = await getExternalStorageDirectory();
        var firstPath = documentDirectory.path + "/images";
        var filePathAndName = documentDirectory.path + '/images/$i.jpg';
        await Directory(firstPath).create(recursive: true); // <-- 1
        File file2 = new File(filePathAndName); // <-- 2
        file2.writeAsBytesSync(response.bodyBytes); // <-- 3
      } catch (e) {
        print(e.toString());
      }
    }
  }

  downloadAllImage({@required List<String> imageUrlList}) async {
    // var documentDirectory = await getExternalStorageDirectory();
    // var firstPath = documentDirectory.path + "/images";
    // var list = [
    //   "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/bigsize.jpg",
    //   "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.jpg",
    //   "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_transparent.png",
    //   "https://raw.githubusercontent.com/wiki/ko2ic/flutter_google_ad_manager/images/sample.gif",
    //   "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter_no.png",
    //   "https://raw.githubusercontent.com/wiki/ko2ic/image_downloader/images/flutter.png",
    // ];

    // List<File> files = [];

    // for (var url in imageUrlList) {
    //   try {
    //     var imageId = await ImageDownloader.downloadImage(url,
    //         destination: AndroidDestinationType.directoryDownloads);
    //     var path = await ImageDownloader.findPath(imageId);
    //     files.add(File(path));
    //   } catch (error) {
    //     print(error);
    //   }
    // }

    // print(files.length);

    // setState(() {
    //   _mulitpleFiles.addAll(files);
    // });
  }
}
