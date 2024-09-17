import 'package:adms/future/order/widget/order.detail.item.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/widget/nav_bar/nab_bar_page.dart';
import '../../../common/widget/page_header/page.header.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //User? user = Get.arguments?['order'] ;
    return NavBarPage(
      child: PageHeader(
        pageTitle: "Détail commande",
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
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                TImages.bagFill,
                                color: TColor.smallTitle,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2), // La couleur que vous souhaitez appliquer
                                  BlendMode.modulate,// Le mode de mélange pour appliquer la couleur
                                ),
                              ),
                            )
                        ),
                        UiHelper.horizontalSpaceMedium,
                        SizedBox(
                          width: TSizes.screenWidth*0.57,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: TSizes.screenWidth*0.6,
                                child: Text(
                                  "Numéro de commande", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: TColor.smallTitle,
                                  fontSize: TSizes.ft16,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.fade,
                                ),),
                              ),
                              Text("#78901", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color:  const Color(0xFFC81577),
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
                      OrderDetailItem(width: TSizes.screenWidth*0.5, itemTitle:  "Nom du client", itemValue: "Jean Dupont",),
                      const SizedBox(width: 5,),
                      OrderDetailItem(width: TSizes.screenWidth*0.37, itemTitle:  "Nom du coursier", itemValue: "Paul Martin",),
                    ],
                  ),
                  UiHelper.verticalSpaceSmall,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailItem(width: TSizes.screenWidth*0.5, itemTitle:  "Adresse de livraison", itemValue: "123 Avenue Steinmetz, Cotonou",),
                      const SizedBox(width: 5,),
                      OrderDetailItem(width: TSizes.screenWidth*0.37, itemTitle:  "Status", itemValue: "En cours de livraison",),
                    ],
                  ),
                  UiHelper.verticalSpaceSmall,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailItem(width: TSizes.screenWidth*0.5, itemTitle:  "Date et heure", itemValue: "28/07/2024, 14:35",),
                      const SizedBox(width: 5,),
                      OrderDetailItem(width: TSizes.screenWidth*0.37, itemTitle:  "Instructions", itemValue: "Livrer sans sonner",),
                    ],
                  ),
                  UiHelper.verticalSpaceSmall,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailItem(width: TSizes.screenWidth*0.5, itemTitle:  "Articles commandés", itemValue: "Pizza Margherita, Coca-Cola x2, Tiramisu",),
                      const SizedBox(width: 5,),
                      OrderDetailItem(width: TSizes.screenWidth*0.37, itemTitle:  "Paiement", itemValue: "Carte de crédit",),
                    ],
                  ),

                  UiHelper.verticalSpaceSmall,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailItem(width: TSizes.screenWidth*0.5, itemTitle:  "Téléphone du coursier", itemValue: "+229 97 12 34 56",),
                      const SizedBox(width: 5,),
                      OrderDetailItem(width: TSizes.screenWidth*0.37, itemTitle:  "Téléphone du client", itemValue: "+229 97 12 34 56",),
                    ],
                  ),
                  SizedBox(height: TSizes.height30,)
                ],
              ),
            )),
      ),
    );
  }
}
