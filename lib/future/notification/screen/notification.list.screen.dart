import 'package:adms/common/widget/page_header/page.header.dart';
import 'package:adms/future/notification/controller/notification.detaail.controller.dart';
import 'package:adms/future/notification/controller/notification.list.controller.dart';
import 'package:adms/future/notification/screen/notification.detail.screen.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../common/widget/loader/loader.dart';
import '../../../common/widget/nav_bar/nab_bar_page.dart';
import '../wdiget/notification.item.dart';

class NotificationListScreen extends GetView<NotificationListController> {
  NotificationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarPage(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
              top: kToolbarHeight,
              left: TSizes.width15,
              right: TSizes.width15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Notification", style: Theme.of(context).textTheme.titleMedium,),
                ],
              ),
              SizedBox(height: TSizes.height20,),
              Expanded(
                child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: Obx(() {
                      if(controller.isLoading.value) {
                        return Center(
                          child: Container(
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
                            itemCount: controller.notificationData.length,
                            itemBuilder: (context, index) {
                              var notification = controller.notificationData[index];
                              return GestureDetector(
                                onTap: () {
                                  navigateToSubPage(context, NotificationDetailScreen());
                                },
                                child: NotificationItem(notificationItem: notification,),
                              );
                            }
                        ),
                      );
                    }),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
