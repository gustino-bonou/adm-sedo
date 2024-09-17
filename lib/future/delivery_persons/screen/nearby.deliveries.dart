import 'package:adms/common/widget/nav_bar/nab_bar_page.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../common/widget/loader/loader.dart';
import '../../authentication/model/user.dart';
import '../widget/nearby.delivery.person.item.dart';
import '../controller/nearby.deliveries.persons.controller.dart';

class NearbyDeliveryPersonListScreen extends GetView<NearbyDeliveryPersonController> {
  const NearbyDeliveryPersonListScreen({Key? key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Text("Assigner un livreur", style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: TSizes.height30
              ),
              child: Text("Livreur à proximité" ,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: TSizes.ft12,
                  fontWeight: FontWeight.w500,
                  color: TColor.smallTitle.withOpacity(0.4) ,
                ),),
            ),
            const SizedBox(height: 5,),
            Divider(height: 1, color:  TColor.kcLightGrey.withOpacity(0.3)),

            Expanded(
              child: SingleChildScrollView(
                child: Obx(() {
                  if(controller.isLoading.value) {
                    return  Center(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: TSizes.screenHeight*0.2
                        ),
                        child: LoadingAnimationWidget.inkDrop(
                          size: 100, color: TColor.kcPrimaryColor,
                        ),
                      ),
                    );
                  } else if(controller.hasError.value) {
                    return Center(
                      child: HasErrorWidget(
                          action:  () {
                            controller.getData();
                          },
                          title: 'title', actionText: 'Réessayer'),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: controller.userList.length,
                      itemBuilder: (context, index){
                        User user = controller.userList[index];
                        return  GestureDetector(
                            onTap: () => controller.goToDetailScreen(user),
                            child: NearbyDeliveryPersonItem(user: user,)
                        );
                      });
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
