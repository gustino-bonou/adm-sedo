import 'package:adms/future/delivery_persons/screen/avalable.deliveries.dart';
import 'package:adms/future/delivery_persons/screen/occupied.dart';
import 'package:adms/utils/enum/enum.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import '../../../common/widget/loader/loader.dart';
import '../../../data/repositories/auth.repository.dart';


class DeliveryPersonListController extends GetxController{
  static  DeliveryPersonListController get instance => Get.find();

  final AuthRepository authRepository;
  DeliveryPersonListController({required this.authRepository});

  void goToDetailScreen() {
    goToNamed(TRoute.deliveryPersonDetail);
  }

  Rx<DeliveryPersonStatus> currentStatus = DeliveryPersonStatus.available.obs;

  Widget buildDeliveryPersons(BuildContext context) {
    return Obx(() =>  ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Obx(() =>  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildActionButton('Disponibles', DeliveryPersonStatus.available, context),
            buildActionButton('Occupés', DeliveryPersonStatus.busy, context),
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

  Widget buildActionButton(String label, DeliveryPersonStatus status, BuildContext context) {
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
      case DeliveryPersonStatus.available:
        return const BuildAvailableDeliveriesList();
      case DeliveryPersonStatus.busy:
        return const OccupiedDeliveriesLis();
      default:
        return Container();
    }
  }

  RxBool isLoading = false.obs;
  String errorMessage = '';

  Future<void> getAvailableDP(context) async {
    if (isLoading.value) return;
    isLoading.value = true;
    Response response = await authRepository.getAvailableDeliveryPersons();
    if (response.statusCode == 200) {
      isLoading.value = false;
      print(response.body);
    } else {
      isLoading.value = false;
      if (response.statusCode == 404) {
        errorMessage = "Aucun coursier trouvé";
      } else {
        errorMessage =
        "Une erreur s'est produite lors de la récupération des données.";
      }
      TLoaders.errorSnackBar(
          title: 'Coursiers',  message: errorMessage);
    }
  }
}