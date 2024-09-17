import 'package:adms/future/order/deliveried_and_echeck/screen/delivered.screen.dart';
import 'package:adms/future/order/deliveried_and_echeck/screen/echec.order.screen.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import '../../../../data/repositories/auth.repository.dart';
import '../../../../utils/enum/enum.dart';

class DeliveredAndEchecScreenController extends GetxController{
  static  DeliveredAndEchecScreenController get instance => Get.find();

  final AuthRepository authRepository;
  DeliveredAndEchecScreenController({required this.authRepository});

  void goToDetailScreen() {
    goToNamed(TRoute.deliveryPersonDetail);
  }

  Rx<OrderStatus> currentStatus = OrderStatus.delivered.obs;

  Widget buildDeliveryPersons(BuildContext context) {
    return Obx(() =>  ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Obx(() =>  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildActionButton('Livrées', OrderStatus.delivered, context),
            buildActionButton('Echouées', OrderStatus.echec, context),
          ],
        ),),
        Container(
          height: 1,
          color: TColor.smallTitle.withOpacity(0.1),
        ),
        buildContent(),
      ],
    ));
  }

  Widget buildActionButton(String label, OrderStatus status, BuildContext context) {
    bool isActive = currentStatus.value == status;
    return GestureDetector(
      onTap: () {
        currentStatus.value = status;
      },
      child: Column(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: TColor.smallTitle.withOpacity(0.8),
                fontSize: TSizes.ft12,
                fontWeight: FontWeight.w400
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 10
            ),
            height: 1,
            width: TSizes.screenWidth*0.4,
            color: isActive ? TColor.smallTitle : Colors.transparent,
          ),

        ],
      ),
    );
  }

  Widget buildContent() {
    switch (currentStatus.value) {
      case OrderStatus.delivered:
        return const BuildDeliveredOrderItems();
      case OrderStatus.echec:
        return const BuildEchecOrderItems();
      default:
        return Container();
    }
  }
}