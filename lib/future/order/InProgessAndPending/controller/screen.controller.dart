import 'package:adms/future/order/InProgessAndPending/screen/in.progress.screen.dart';
import 'package:adms/future/order/InProgessAndPending/screen/pending.screen.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import '../../../../data/repositories/auth.repository.dart';
import '../../../../utils/enum/enum.dart';

class InProgressAnPendingScreenController extends GetxController{
  static  InProgressAnPendingScreenController get instance => Get.find();

  final AuthRepository authRepository;
  InProgressAnPendingScreenController({required this.authRepository});

  void goToDetailScreen() {
    goToNamed(TRoute.deliveryPersonDetail);
  }

  Rx<OrderStatus> currentStatus = OrderStatus.inProgress.obs;

  Widget buildDeliveryPersons(BuildContext context) {
    return Obx(() =>  ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Obx(() =>  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildActionButton('En cours', OrderStatus.inProgress, context),
            buildActionButton('En attente', OrderStatus.pending, context),
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
      case OrderStatus.inProgress:
        return const BuildInProgressOrderItems();
      case OrderStatus.pending:
        return const BuildPendingOrderItems();
      default:
        return Container();
    }
  }
}