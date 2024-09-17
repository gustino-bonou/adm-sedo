

import 'package:adms/future/authentication/model/user.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/widget/nav_bar/nab_bar_page.dart';
import '../../../common/widget/page_header/page.header.dart';

class DeliveryPersonDetailScreen extends StatelessWidget {
  const DeliveryPersonDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = Get.arguments?['user'] ;
    return NavBarPage(
      child: PageHeader(
        pageTitle: user?.fullName() ?? "",
        child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: TSizes.height10
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: TSizes.height10,
                        horizontal: TSizes.width10
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: TColor.smallTitle.withOpacity(0.05)
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 53,
                          width: 53,
                          decoration: BoxDecoration(
                              color: TColor.kcLightGrey.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: SvgPicture.asset(
                                  TImages.user,
                                  color: TColor.smallTitle,
                                  height: 38,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.2), // La couleur que vous souhaitez appliquer
                                    BlendMode.modulate,// Le mode de mélange pour appliquer la couleur
                                  ),
                                ),
                              )
                          ),
                        ),
                        UiHelper.horizontalSpaceMedium,
                        SizedBox(
                          width: TSizes.screenWidth*0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: TSizes.screenWidth*0.5,
                                child: Text(
                                  user?.fullName() ?? "", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: TColor.smallTitle,
                                  fontSize: TSizes.ft16,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.fade,
                                ),
                                ),
                              ),
                              Text("Coursier depuis 2 mois", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: TColor.smallTitle.withOpacity(0.55),
                                  fontSize: 12
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  UiHelper.verticalSpaceSmall,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Première colonne
                      SizedBox(
                        width: TSizes.screenWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Numéro de téléphone",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: TColor.mediumTitle,
                                    fontSize: TSizes.ft14,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.fade
                                )
                            ),
                            UiHelper.verticalSpaceSmall,
                            Text(user?.phoneNumber ?? "", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: TColor.mediumTitle.withOpacity(0.4),
                                fontSize: TSizes.ft12,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade
                            ), )
                            // Ajoutez plus de widgets ici
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 5
                        ),
                        width: TSizes.screenWidth * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Email",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColor.mediumTitle,
                                  fontSize: TSizes.ft14,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                            UiHelper.verticalSpaceSmall,
                            Text(user?.email ?? "", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: TColor.mediumTitle.withOpacity(0.4),
                                fontSize: TSizes.ft12,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade
                            ), )
                            // Ajoutez plus de widgets ici
                          ],
                        ),
                      ),
                    ],
                  ),
                  UiHelper.verticalSpaceSmall,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Première colonne
                      SizedBox(
                        width: TSizes.screenWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Capacités actuelles",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: TColor.mediumTitle,
                                    fontSize: TSizes.ft14,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.fade
                                )
                            ),
                            UiHelper.verticalSpaceSmall,
                            Text("4/5 commandes", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: TColor.mediumTitle.withOpacity(0.4),
                                fontSize: TSizes.ft12,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade
                            ), )
                            // Ajoutez plus de widgets ici
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 5
                        ),
                        width: TSizes.screenWidth * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Proximité",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColor.mediumTitle,
                                  fontSize: TSizes.ft14,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                            UiHelper.verticalSpaceSmall,
                            Text("1.8 km", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: TColor.mediumTitle.withOpacity(0.4),
                                fontSize: TSizes.ft12,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade
                            ), )
                            // Ajoutez plus de widgets ici
                          ],
                        ),
                      ),
                    ],
                  ),
                  UiHelper.verticalSpaceMedium,
                  Text("Course", style: Theme.of(context).textTheme.titleMedium,),

                  UiHelper.verticalSpaceSmall,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Première colonne
                      SizedBox(
                        width: TSizes.screenWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Num commande",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: TColor.mediumTitle,
                                    fontSize: TSizes.ft14,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.fade
                                )
                            ),
                            UiHelper.verticalSpaceSmall,
                            Text("#87485", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: TColor.mediumTitle.withOpacity(0.4),
                                fontSize: TSizes.ft12,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade
                            ), )
                            // Ajoutez plus de widgets ici
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 5
                        ),
                        width: TSizes.screenWidth * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Nom du client",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColor.mediumTitle,
                                  fontSize: TSizes.ft14,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                            UiHelper.verticalSpaceSmall,
                            Text("Bonou Augustin", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: TColor.mediumTitle.withOpacity(0.4),
                                fontSize: TSizes.ft12,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade
                            ), )
                            // Ajoutez plus de widgets ici
                          ],
                        ),
                      ),
                    ],
                  ),
                  UiHelper.verticalSpaceSmall,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Première colonne
                      SizedBox(
                        width: TSizes.screenWidth * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Adresse",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: TColor.mediumTitle,
                                    fontSize: TSizes.ft14,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.fade
                                )
                            ),
                            UiHelper.verticalSpaceSmall,
                            Text("123 Avenue Steinmetz", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: TColor.mediumTitle.withOpacity(0.4),
                                fontSize: TSizes.ft12,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade
                            ), )
                            // Ajoutez plus de widgets ici
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 5
                        ),
                        width: TSizes.screenWidth * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Téléphone",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColor.mediumTitle,
                                  fontSize: TSizes.ft14,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                            UiHelper.verticalSpaceSmall,
                            Text("60 40 90 20", style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: TColor.mediumTitle.withOpacity(0.4),
                                fontSize: TSizes.ft12,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade
                            ), )
                            // Ajoutez plus de widgets ici
                          ],
                        ),
                      ),
                    ],
                  ),
                  UiHelper.verticalSpaceMedium,
                  Text("Suivi de la commande", style: Theme.of(context).textTheme.titleMedium,),

                  UiHelper.verticalSpaceSmall,
                ],
              ),
            )),
      ),
    );
  }
}
