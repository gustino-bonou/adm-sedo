import 'package:adms/future/order/deliveried_and_echeck/controller/screen.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/widget/nav_bar/nab_bar_page.dart';

class DeliveredAndEchecScreens extends GetView<DeliveredAndEchecScreenController> {
  const DeliveredAndEchecScreens({Key? key}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(
                      TImages.backIcon, color: Colors.black,
                      width: 35,
                    ),
                  ),
                ]
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