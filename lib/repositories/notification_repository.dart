import 'package:childcaresoftware/constants/api.dart';
import 'package:childcaresoftware/models/models.dart';
import 'package:childcaresoftware/services/remote/network_service.dart';

class NotificationRepository {
  final NetworkService _networkService = NetworkService.instance;

  getNotificationList() async {
    final response =
        await _networkService.get(NotificationAPI.NOTIFICATION_LIST_URL);
    final data = NotificationsResponse.fromJson(response);
    return data;
  }

  putNotificationMarkAsRead(int id) async {
    final response = await _networkService
        .put(NotificationAPI.NOTIFICATION_MARK_AS_READ, data: {'id': id});
    return response;
  }
}
