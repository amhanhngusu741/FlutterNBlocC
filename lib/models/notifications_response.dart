class NotificationsResponse {
  List<NotificationItem> items;
  int total;
  int unread;

  NotificationsResponse({this.items, this.total, this.unread});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<NotificationItem>();
      json['items'].forEach((v) {
        items.add(new NotificationItem.fromJson(v));
      });
    }
    total = json['total'];
    unread = json['unread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['unread'] = this.unread;
    return data;
  }
}

class NotificationItem {
  int id;
  String message;
  String action;
  String event;
  int read;
  String createdAt;
  String timeAgo;
  dynamic actionMobile;

  NotificationItem(
      {this.id,
      this.message,
      this.action,
      this.event,
      this.read,
      this.createdAt,
      this.timeAgo,
      this.actionMobile});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    action = json['action'];
    event = json['event'];
    read = json['read'];
    createdAt = json['created_at'];
    timeAgo = json['time_ago'];
    actionMobile = json['action_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['action'] = this.action;
    data['event'] = this.event;
    data['read'] = this.read;
    data['created_at'] = this.createdAt;
    data['time_ago'] = this.timeAgo;
    data['action_mobile'] = this.actionMobile;
    return data;
  }
}
