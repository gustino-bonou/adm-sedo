import 'package:adms/future/delivery_persons/controller/available.deliveries.persons.controller.dart';
import 'package:adms/future/delivery_persons/widget/available.delivery.item.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../common/widget/loader/loader.dart';
import '../../authentication/model/user.dart';

class BuildAvailableDeliveriesList extends GetView<AvailableDeliveryPersonController> {
  const BuildAvailableDeliveriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.only(
         top: TSizes.height15
     ),
     child: Obx(() {
       if(controller.isLoading.value) {
         return Center(
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
         return  Center(
           child: HasErrorWidget(
               action:  () {
                 controller.getData();
               },
               title: 'title', actionText: 'Réessayer'),
         );
       }
       return SingleChildScrollView(
         child: ListView.builder(
             shrinkWrap: true,
             physics: const ClampingScrollPhysics(),
             itemCount: controller.userList.length,
             itemBuilder: (context, index){
               User user = controller.userList[index];
           return AvailableDPItem(user: user,);
         }),
       );
     }),
   );
  }
}
