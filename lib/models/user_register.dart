import 'package:intl/intl.dart';

class UserRegister {
  String firstName;
  String lastName;
  String email;
  String phone;
  UserRegister({this.firstName, this.lastName, this.email, this.phone});
}

List<UserRegister> listUserRegister() {
  List<UserRegister> usersRegister = List();
  usersRegister.add(UserRegister(
      firstName: "HUYNH",
      lastName: "NGỌC TÀI",
      email: "huynhngoctai92@gmail.com",
      phone: "0776511233"));
  return usersRegister;
}

class UserResponse {
  // List<SellerItem> items;
  int accounntId;
  DateTime createDate;
  String companyName;
  String primaryUser;
  UserResponse({
    this.accounntId,
    this.createDate,
    this.companyName,
    this.primaryUser,
  });
  UserResponse.fromJson(Map<String, dynamic> json) {
    accounntId = json['user'] == null ? 0 : json['user']['id'];
    createDate = json['user'] == null
        ? new DateFormat()
        : new DateFormat("yyyy-MM-dd").parse(json['user']['created_at']);
    companyName = json['user'] == null ? '' : json['user']['company'];
    primaryUser = json['user'] == null ? '' : json['user']['email'];
    // if (json['seller_list'] != null) {
    //   items = new List<SellerItem>();
    //   json['seller_list'].forEach((v) {
    //     items.add(new SellerItem.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accounnt_id'] = this.accounntId;
    data['created_at'] = this.createDate;
    data['company_name'] = this.companyName;
    data['primary_user'] = this.primaryUser;
    // if (this.items != null) {
    //   data['seller_list'] = this.items.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
