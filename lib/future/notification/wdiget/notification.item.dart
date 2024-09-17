import 'package:adms/utils/helper/import.app.path.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notificationItem}) : super(key: key);

  final dynamic notificationItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: TSizes.height10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: TColor.kcPrimaryColor,
                radius: 4,
              ),
              const SizedBox(width: TSizes.tinySize,),
              Text(notificationItem['date'],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: TSizes.ft12,
                  fontWeight: FontWeight.w500,
                  color: TColor.smallTitle.withOpacity(0.4) ,
                ),
              ),
            ],
          ),
          UiHelper.verticalSpaceSmall,
          Text.rich(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: TColor.smallTitle.withOpacity(0.8),
                fontSize: TSizes.ft12
              ),
              TextSpan(
                  children: [
                    TextSpan(
                        text: notificationItem['title']
                    ),
                    TextSpan(
                        text:' - '
                    ),
                    TextSpan(
                        text: notificationItem['desc']
                    ),
                  ]
              )
          ),
          UiHelper.verticalSpaceMedium,
          Divider(height: 1, color:  TColor.kcLightGrey.withOpacity(0.3)),
        ],
      ),
    );
  }
}
