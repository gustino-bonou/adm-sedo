import 'package:adms/common/widget/buttons/button_component.dart';
import 'package:adms/future/notification/controller/notification.detaail.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/widget/nav_bar/nab_bar_page.dart';
import '../wdiget/course.detail.item.dart';
import '../wdiget/notification.article.item.dart';

class NotificationDetailScreen extends GetView<NotificationDetailController> {
  const NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarPage(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
              top: kToolbarHeight,
              left: TSizes.width15,
              right: TSizes.width15,
          ),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => returnToPreviousPage(context),
                    child: SvgPicture.asset(
                      TImages.backIcon, color: Colors.black,
                      width: 35,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text("Notification", style: Theme.of(context).textTheme.titleMedium,),
                ],
              ),
              SizedBox(height: TSizes.height20,),
              Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: TSizes.height50
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: TColor.kcPrimaryColor,
                                radius: 4,
                              ),
                              const SizedBox(width: TSizes.tinySize,),
                              Text(controller.notificationDetail['date'],
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: TSizes.ft12,
                                  fontWeight: FontWeight.w500,
                                  color: TColor.smallTitle.withOpacity(0.4) ,
                                ),
                              ),
                            ],
                          ),

                          UiHelper.verticalSpaceSmall,
                          Text.rich(
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: TColor.smallTitle.withOpacity(0.8),
                                  fontSize: TSizes.ft12
                              ),
                              TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: "Description : "
                                    ),
                                    TextSpan(
                                        text: controller.notificationDetail['description']
                                    ),
                                  ]
                              )
                          ),
                          UiHelper.verticalSpaceSmall,
                          Divider(height: 1, color:  TColor.kcLightGrey.withOpacity(0.3)),
                          SizedBox(height: TSizes.height30,),
                          Text(
                            "Détail de la notification :", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: TColor.smallTitle.withOpacity(0.8),
                              fontSize: TSizes.ft12
                          ),),
                          Container(
                            padding: const EdgeInsets.only(
                              top: TSizes.tinySize,
                              left: 5,
                            ),
                            margin: EdgeInsets.only(
                                bottom: TSizes.height30
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CourseDetailItem(title: 'Numéro de la course', detail: controller.notificationDetail['race_number'],),
                                CourseDetailItem(title: 'Nom du client', detail: controller.notificationDetail['customer_name'],),
                                CourseDetailItem(title: 'Adresse de livraison', detail: controller.notificationDetail['delivery_address'],),
                                CourseDetailItem(title: 'Numéro de téléphone', detail: controller.notificationDetail['phone'],),
                                CourseDetailItem(title: 'Date et heure de la commande', detail: controller.notificationDetail['order_date'],),
                                NotificationArticleItems(articleNames: controller.notificationDetail['articles'] ,),
                                CourseDetailItem(title: 'Mode de paiement', detail: controller.notificationDetail['payment_mode'],),
                                CourseDetailItem(title: 'Statut de la commande', detail: controller.notificationDetail['order_status'],),
                                CourseDetailItem(title: 'Instructions spéciales', detail: controller.notificationDetail['spacial_instruction'],),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SimpleButton(text: "Valider"),
                              SizedBox(width: 5,),
                              OutlineNextButton(
                                  canDoAction: true,
                                  text: 'Assigner un livreur',
                                  onPressed: () => controller.goToDeliveryPersonsScreen()
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          )
        ),
      ),
    );
  }
}
