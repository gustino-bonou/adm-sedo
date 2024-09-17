import 'package:adms/utils/helper/import.app.path.dart';
import '../api/api.client.dart';

class AuthRepository extends GetxService{
  static AuthRepository  get instance => Get.find();
  final ApiClient apiClient;
  AuthRepository({ required this.apiClient});

  Future<Response> register(dynamic data) async{
    return await apiClient.postFrom(ApiConstant.REGISTER, data);
  }
  Future<Response> login(dynamic data) async{
    return await apiClient.postFrom(ApiConstant.LOGIN, data);
  }
  Future<Response> receiveOtpByMail(dynamic data, String userId) async{
    return await apiClient.postFrom(ApiConstant.receiveOtp(userId), data);
  }
  Future<Response> verifyOtp(dynamic data, userId) async{
    return await apiClient.postFrom(ApiConstant.verifyOtp(userId), data);
  }

  Future<Response> getAvailableDeliveryPersons() async{
    return await apiClient.getFrom(ApiConstant.AVAILABLE_DELIVERY_PERSONS);
  }

  Future<Response> getOccupiedDeliveryPersons() async{
    return await apiClient.getFrom(ApiConstant.OCCUPIED_DELIVERY_PERSONS);
  }

  Future<Response> getNearbyDeliveryPersons() async{
    return await apiClient.getFrom(ApiConstant.NEARBY_DELIVERY_PERSONS);
  }
}