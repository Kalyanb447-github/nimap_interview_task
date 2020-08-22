class RecordModel {
  int id;
  String title;
  String shortDescription;
  int collectedValue;
  int totalValue;
  String startDate;
  String endDate;
  String mainImageURL;

  RecordModel(
      {this.id,
      this.title,
      this.shortDescription,
      this.collectedValue,
      this.totalValue,
      this.startDate,
      this.endDate,
      this.mainImageURL});

  RecordModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['title'];
    shortDescription = json['shortDescription'];
    collectedValue = json['collectedValue'];
    totalValue = json['totalValue'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    mainImageURL = json['mainImageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['title'] = this.title;
    data['shortDescription'] = this.shortDescription;
    data['collectedValue'] = this.collectedValue;
    data['totalValue'] = this.totalValue;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['mainImageURL'] = this.mainImageURL;
    return data;
  }
}
