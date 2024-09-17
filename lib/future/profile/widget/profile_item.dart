import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.itemName, required this.itemValue});

  final String itemName;
  final String itemValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: TSizes.width15
      ),
      padding: const EdgeInsets.only(
        top: 20,
        left: 8,
        right: 8,
        bottom: 20
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  itemName,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: TSizes.ft16,
                    color:  const Color(0xFF150B3D),
                  )
              ),
              UiHelper.verticalSpaceSmall,
              Text(
                itemValue,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: TSizes.ft12,
                  color:  const Color(0xFF150B3D).withOpacity(0.4),
                )
              ),
            ],
          ),
          SvgPicture.asset(TImages.redPen)
        ],
      ),
    );
  }
}
