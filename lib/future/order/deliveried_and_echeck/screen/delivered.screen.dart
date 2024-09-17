import 'package:adms/future/order/deliveried_and_echeck/controller/delivered.order.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../common/widget/loader/loader.dart';
import '../../widget/order.item.dart';

class BuildDeliveredOrderItems extends GetView<DeliveredOrderController> {
  const BuildDeliveredOrderItems({Key? key}) : super(key: key);

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
              itemCount: 10,
              itemBuilder: (context, index){
                // User user = controller.userList[index];
                return GestureDetector(
                    onTap: () => goToNamed(TRoute.orderDetail),
                    child: const OrderItem());
              }),
        );
      }),
    );
  }
}
