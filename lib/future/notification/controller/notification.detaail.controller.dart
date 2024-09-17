import 'package:adms/utils/helper/import.app.path.dart';
import 'package:get/get.dart';

import '../../../data/repositories/auth.repository.dart';


class NotificationDetailController extends GetxController{
  static  NotificationDetailController get instance => Get.find();

  final AuthRepository authRepository;
  NotificationDetailController({required this.authRepository});

  Map<String, dynamic> notificationDetail = {
    'date' : '03 Mai 2024 12:30',
    'description' : 'Un nouveau code promotionnel a été créé et est maintenant disponible pour les clients.',
    'race_number' : "#78901",
    'customer_name' : "Marcos Aite",
    'delivery_address' : "Carré 125 rue 11",
    'phone' : "+229 60 40 90 20",
    'order_date' : "05 Aout 2024, 15:20",
    'articles' : ['1 X Pizza Magherita', '2 X Coca-Cola 33cl', '1 X Tiramisu',],
    'payment_mode' : 'Carte de Crédit (terminé)',
    'order_status' : 'En attente de traitement',
    'spacial_instruction' : 'Livrer sans sonner, merci.',
  };

  void goToDeliveryPersonsScreen() {
    goToNamed(TRoute.deliveryPersons);
  }
}