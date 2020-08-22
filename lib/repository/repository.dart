import 'package:nimap_interview_task/api/api.dart';

class Repository {
  Future fetchAllRecordsFromApi() async {
    return await Api().getDataFromServer(url: "testdata.json");
  }
}
