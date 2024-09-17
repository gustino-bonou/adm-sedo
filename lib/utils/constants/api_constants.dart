

// ignore_for_file: constant_identifier_names

class ApiConstant {
  ApiConstant._();

  static const String BASE_URL = 'http://148.113.180.22:8000';
  static const String TOKEN = '';
  static const String LOGIN = '/login';
  static const String REGISTER = '/signup';
  static String receiveOtp(userId) => '/VerifyMail/$userId';
  static String verifyOtp(userId) => '/verifyOtp/$userId';
  static const String AVAILABLE_DELIVERY_PERSONS = '/couriers/status/FREE';
  static const String OCCUPIED_DELIVERY_PERSONS = '/couriers/status/OCCUPIED';
  static const String NEARBY_DELIVERY_PERSONS = '/couriers/status/FREE';
  static const String NOTIFICATIONS_LIST = '/notifications';

}