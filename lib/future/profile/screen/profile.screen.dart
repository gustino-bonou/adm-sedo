import 'package:adms/common/widget/nav_bar/nab_bar_page.dart';
import 'package:adms/future/profile/controller/profile.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarPage(
      child: Container(
        padding: EdgeInsets.only(
            top: kToolbarHeight,
            left: TSizes.width15,
            right: TSizes.width15
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Profil", style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
            SizedBox(height: TSizes.height20,),
           Expanded(child: SingleChildScrollView(
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.all(15),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(24),
                       color: TColor.smallTitle.withOpacity(0.05)
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Container(
                             decoration: BoxDecoration(
                                 color: TColor.kcLightGrey.withOpacity(0.7),
                                 borderRadius: BorderRadius.circular(45)
                             ),
                             height: 65,
                             width: 65,
                             child: Center(
                                 child: Icon(
                                   Icons.person,
                                   color: TColor.smallTitle.withOpacity(0.5),
                                   size: 50,)
                             ),
                           ),
                           UiHelper.horizontalSpaceMedium,
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(
                                 width: TSizes.screenWidth*0.4,
                                 child: Text(
                                   controller.user.fullName(),
                                   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                       color: TColor.smallTitle,
                                       fontSize: TSizes.ft16,
                                       overflow: TextOverflow.ellipsis,
                                       fontWeight: FontWeight.w700
                                   ),
                                 ),
                               ),
                               SizedBox(
                                 width: TSizes.screenWidth*0.4,
                                 child: Text(
                                   "Administrateur depuis 3 mois",
                                   style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                     color: TColor.smallTitle.withOpacity(0.55),
                                     fontSize: 11
                                   ),
                                 ),
                               )
                             ],
                           ),
                         ],
                       ),
                       GestureDetector(
                         onTap: () => goToNamed(TRoute.updateProfile),
                         child: SvgPicture.asset
                           (TImages.blackPen, height: 25, width: 25, ),
                       ),
                     ],
                   ),
                 ),
                 UiHelper.verticalSpaceLarge,

                 Center(child: SvgPicture.asset(TImages.profile,)),
                 UiHelper.verticalSpaceLarge,
                 GestureDetector(
                   onTap: () => goToNamed(TRoute.updateProfile),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(
                             Icons.settings,
                             color: TColor.smallTitle.withOpacity(0.7),
                           ),
                           UiHelper.horizontalSpaceSmall,
                           Text(
                             "Parametres du compte",
                             style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                 fontSize: TSizes.ft14,
                                 fontWeight: FontWeight.w400,
                                 color: TColor.smallTitle.withOpacity(0.7)
                             ),
                           )
                         ],
                       ),
                       Icon(
                         Icons.arrow_forward_ios,
                         color: TColor.smallTitle.withOpacity(0.7),
                         size: 20,)
                     ],
                   ),
                 ),
                 SizedBox(height: TSizes.height15,),
                 GestureDetector(
                   //onTap: () => viewModel.goToCourseHistoricView(),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(Icons.add_circle_outline_rounded,
                               color: TColor.smallTitle.withOpacity(0.7)),
                           UiHelper.horizontalSpaceSmall,
                           Text(
                             "Ajouter un administrateur",
                             style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                 fontSize: TSizes.ft14,
                                 fontWeight: FontWeight.w400,
                                 color: TColor.smallTitle.withOpacity(0.7)
                             ),
                           )
                         ],
                       ),
                       Icon(
                         Icons.arrow_forward_ios,
                         color: TColor.smallTitle.withOpacity(0.7),
                         size: 20,
                       )
                     ],
                   ),
                 ),
                 SizedBox(height: TSizes.height15,),
                 Row(
                   children: [
                     const Icon(Icons.logout, color: Color(0xFFEA1C24),),
                     UiHelper.horizontalSpaceSmall,
                     Text(
                       "Déconnexion",
                       style: Theme.of(context).textTheme.titleSmall!.copyWith(
                         fontSize: TSizes.ft14,
                         fontWeight: FontWeight.w400,
                         color: const Color(0xFFEA1C24),
                       ),
                     )
                   ],
                 ),
                 UiHelper.verticalSpaceLarge,
               ],
             ),
           ))
          ],
        ),
      ),
    );
  }
}
