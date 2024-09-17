import 'package:adms/common/widget/nav_bar/nab_bar_page.dart';
import 'package:adms/future/delivery_persons/controller/delivery.persons.list.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';


class DeliveryListScreen extends GetView<DeliveryPersonListController> {
  const DeliveryListScreen({Key? key}) : super(key: key);

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
                  Text("Cousiers", style: Theme.of(context).textTheme.titleMedium,),
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
