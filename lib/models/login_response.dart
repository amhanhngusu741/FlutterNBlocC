class LoginResponse {
  User user;
  String token;
  // String tokenType;
  List<Account> accounts;
  LoginResponse({this.user, this.token, this.accounts});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    // tokenType = json['token_type'];
    if (json['accounts'] != null) {
      accounts = new List<Account>();
      json['accounts'].forEach((v) {
        accounts.add(new Account.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['accounts'] = this.accounts;
    data['token'] = this.token;
    return data;
  }
}

class User {
  String firstName;
  String lastName;
  String email;
  int userId;
  User({this.firstName, this.lastName, this.email, this.userId});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    userId = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['id'] = this.userId;
    return data;
  }
}

class Account {
  int id;
  String mwsDbServer;

  Account({this.id, this.mwsDbServer});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mwsDbServer = json['mws_db_server'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mws_db_server'] = this.mwsDbServer;
    return data;
  }
}
