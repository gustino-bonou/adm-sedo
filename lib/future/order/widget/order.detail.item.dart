import 'package:adms/utils/helper/import.app.path.dart';

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem({
    super.key, required this.width, required this.itemTitle, required this.itemValue,
  });

  final double width;
  final String itemTitle;
  final String itemValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
                itemTitle,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: TColor.mediumTitle.withOpacity(0.8),
                    fontSize: TSizes.ft14,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.fade
                )
            ),
          ),
          UiHelper.verticalSpaceSmall,
          Text( itemValue, style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: TColor.mediumTitle.withOpacity(0.4),
              fontSize: TSizes.ft12,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.fade
          ), )
        ],
      ),
    );
  }
}
