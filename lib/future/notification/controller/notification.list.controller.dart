import 'package:adms/data/repositories/notification.repository.dart';
import 'package:adms/future/notification/model/notification.model.dart';
import 'package:adms/utils/enum/enum.dart';
import 'package:get/get.dart';

import '../../../common/widget/loader/loader.dart';


class NotificationListController extends GetxController{
  static  NotificationListController get instance => Get.find();

  final NotificationRepository repository;
  NotificationListController({required this.repository});


  String errorMessage = '';
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;
  RxList<NotificationModel> filteredList = <NotificationModel>[].obs;
  RxInt currentPage = 1.obs;


  Future<void> getAllNotifications() async {
    isLoading.value = true;
    Response response = await repository.allNotifications();
    print(response.body);
    if (response.statusCode == 200) {
      hasError.value =  false;
      // List<dynamic> jsonData = response.body;
      // List<NotificationModel> notifications = jsonData.map((json) => NotificationModel.fromJson(json)).toList();
      // notificationList.addAll(notifications);
      // filteredList.value = notificationList;
      isLoading.value = false;
    } else {
      hasError.value =  true;
      isLoading.value = false;
      print(response.body);
      if (response.statusCode == 404) {
        errorMessage = "Aucune notification trouvée";

      } else {
        errorMessage =
        "Une erreur s'est produite lors de la récupération des notifications.";
      }
      TLoaders.errorSnackBar(title: "Notifications", message: errorMessage);
    }
  }

  void getData() {
    notificationList.clear();
    filteredList.clear();
    currentPage.value = 1;
    getAllNotifications();
  }

  @override
  void onInit() async{
    super.onInit();
    getData();
  }

  NotificationType? buildNotificationType(String? type) {
    NotificationType notificationType  = NotificationType.newOrder;
    switch(type) {
      case "NEW_USER" :
        notificationType = NotificationType.newDeliver;
        break;
      case "NEW_PROPOSAL" :
        notificationType = NotificationType.newProposal;
        break;
      case "UPDATE_ORDER" :
        notificationType = NotificationType.updateOrder;
        break;
    }
    return notificationType;
  }




  List notificationData = [
    {
      "date" : "02 Mai 2024 18:30",
      "title" : "Nouvelle commande reçu ",
      'desc' : "Un client a passé une nouvelle course, veuillez la traiter dès que possible."
    },
    {
      'date' : "02 Mai 2024 18:45",
      'title' : "Nouveau livreur inscrit ",
      'desc' : "Un nouveau livreur s'est inscrit et attend l'approbation de l'administrateur."
    },
    {
      'date' : "02 Mai 2024 20:30",
      'title' : "Problème de paiement ",
      'desc' : "Un problème est survenu lors du traitement du paiement pour la course #67890."
    },
    {
      'date' : "03 Mai 2024 12:30",
      'title' : "Changement de l'adresse de livraison ",
      'desc' : "Le client a mis à jour l'adresse de livraison pour la commande #54321."
    },
    {
      'date' : "03 Mai 2024 12:40",
      'title' : "Nouveau code promo créé ",
      'desc' : "Un nouveau code promotionnel a été créé et est maintenant disponible pour les clients."
    },
    {
      'date' : "03 Mai 2024 12:55",
      'title' : "Changement de l'adresse de livraison ",
      'desc' : "Le client a mis à jour l'adresse de livraison pour la commande #54321."
    },
    {
      'date' : "03 Mai 2024 13:00",
      'title' : "Nouveau commentaire client ",
      'desc' : "Un client a laissé un commentaire sur sa récente commande, veuillez le consulter."
    },
    {
      'date' : "03 Mai 2024 13:03",
      'title' : "Annulation de la course ",
      'desc' : "La commande #11223 a été annulée par le client."
    },
    {
      'date' : "04 Mai 2024 12:55",
      'title' : "Changement de l'adresse de livraison ",
      'desc' : "Le client a mis à jour l'adresse de livraison pour la commande #54321."
    },
    {
      'date' : "04 Mai 2024 12:30",
      'title' : "Changement de l'adresse de livraison ",
      'desc' : "Le client a mis à jour l'adresse de livraison pour la commande #54321."
    },
  ];
}