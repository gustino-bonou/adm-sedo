

import 'package:adms/future/order/InProgessAndPending/controller/screen.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/widget/nav_bar/nab_bar_page.dart';

class OrderInProgressAndPendingScreens extends GetView<InProgressAnPendingScreenController> {
  const OrderInProgressAndPendingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarPage(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
              top: kToolbarHeight,
              left: TSizes.width15,
              right: TSizes.width15
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          TImages.backIcon, color: Colors.black,
                          width: 35,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text("Commandes", style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => goToNamed(TRoute.deliveredAndEchecOrder),
                    child: SvgPicture.asset(
                      TImages.nextIcon, color: Colors.black,
                      width: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.height20,),
              Expanded(child: controller.buildDeliveryPersons(context))
            ],
          ),
        ),
      ),
    );
  }
}