import 'package:adms/utils/helper/import.app.path.dart';
import '../api/api.client.dart';

class NotificationRepository extends GetxService{
  static NotificationRepository  get instance => Get.find();
  final ApiClient apiClient;
  NotificationRepository({ required this.apiClient});

  Future<Response> allNotifications() async{
    return await apiClient.get(ApiConstant.NOTIFICATIONS_LIST);
  }
}