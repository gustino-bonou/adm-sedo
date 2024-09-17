import 'package:adms/common/widget/nav_bar/nab_bar_page.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../controller/profile.controller.dart';
import '../widget/profile_item.dart';

class UpdateProfileScreen extends GetView<ProfileController> {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarPage(child: Container(
        padding: const EdgeInsets.only(
            top: kToolbarHeight,
        ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: TSizes.width15
            ),
            child: Row(
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
                Text("Paramètre du compte", style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          ),
          SizedBox(height: TSizes.height20,),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: TSizes.width15,
                    right: TSizes.width15,
                    bottom: TSizes.width15,
                  ),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: TColor.smallTitle.withOpacity(0.05)
                  ),
                  child: Row(
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
                      SizedBox(width: TSizes.width20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: TSizes.screenWidth*0.5,
                            child: Text(
                              controller.user.fullName(),
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColor.smallTitle,
                                  fontSize: TSizes.ft16,
                                  overflow: TextOverflow.fade,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                          ),
                          SizedBox(
                            width: TSizes.screenWidth*0.5,
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
                ),
                Container(
                  height: TSizes.height15,
                ),

                Container(
                  color: const Color(0xFF99ABC6).withOpacity(0.10),

                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => controller.openNameDialog(context, 'phone'),
                        child: ProfileItem(itemName: 'Numero de téléphone', itemValue: controller.user.phoneNumber ?? '',),
                      ),
                      UiHelper.verticalSpaceSmall,
                       GestureDetector(
                         onTap:  () => controller.openNameDialog(context, 'email'),
                           child: ProfileItem(itemName: 'Email', itemValue: controller.user.email ?? '',)),
                      UiHelper.verticalSpaceSmall,
                       GestureDetector(
                         onTap:  () => controller.openNameDialog(context, 'surname'),
                           child: ProfileItem(itemName: 'Prenom', itemValue: controller.user.surname ?? '',)),
                      UiHelper.verticalSpaceSmall,
                       GestureDetector(
                         onTap:  () => controller.openNameDialog(context, 'name'),
                           child: ProfileItem(itemName: 'Nom', itemValue: controller.user.name ?? '',)),
                    ],
                  ),
                ),
                Container(
                  height: TSizes.height10,
                  color: const Color(0xFF99ABC6).withOpacity(0.08),
                )
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
