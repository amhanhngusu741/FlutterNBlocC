class DataResponse {
  bool success;
  String message;
  dynamic payload;

  DataResponse({this.success, this.message, this.payload});

  DataResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    payload = json['payload'] ?? {};
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['payload'] = this.payload;
    return data;
  }
}
