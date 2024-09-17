
import 'package:adms/future/authentication/model/user.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widget/rating/custom.rating.dart';

class AvailableDPItem extends StatelessWidget {
  const AvailableDPItem({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            bottom: TSizes.height10
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: TColor.smallTitle.withOpacity(0.05)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 53,
              width: 53,
              decoration: BoxDecoration(
                  color: TColor.kcLightGrey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      TImages.user,
                      color: TColor.smallTitle,
                      height: 38,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.modulate,
                      ),
                    ),
                  )
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: TSizes.width20
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: TSizes.screenWidth*0.35,
                          child: Text(
                            user.fullName(),
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: TColor.smallTitle,
                              fontSize: TSizes.ft16,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: TSizes.width10,
                              vertical: 5
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2C2C2C),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              "Assigner",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: const Color(0xFFF5F5F5),
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Text.rich(
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: TColor.smallTitle.withOpacity(0.50),
                              fontSize: 12
                          ),
                          TextSpan(
                              children: [
                                const TextSpan(
                                    text: "Téléphone : "
                                ),
                                TextSpan(
                                    text: user.phoneNumber
                                ),
                              ]
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: TSizes.screenWidth*0.40,
                          child: Text.rich(
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: TColor.smallTitle.withOpacity(0.55),
                                fontSize: 12
                            ),
                            TextSpan(
                                children: [
                                  const TextSpan(
                                      text: "Mail : "
                                  ),
                                  TextSpan(
                                      text: user.email
                                  ),
                                ]
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const StarRating(rating: 3),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
