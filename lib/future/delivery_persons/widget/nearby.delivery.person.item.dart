import 'package:adms/future/authentication/model/user.dart';
import 'package:adms/utils/constants/colors.dart';
import 'package:adms/utils/constants/images_string.dart';
import 'package:adms/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/widget/rating/custom.rating.dart';

class NearbyDeliveryPersonItem extends StatelessWidget {
  const NearbyDeliveryPersonItem({Key? key, required this.user}) : super(key: key);

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
                          width: TSizes.screenWidth*0.38,
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
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Text.rich(
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: TColor.smallTitle.withOpacity(0.55),
                              fontSize: 12
                          ),
                          const TextSpan(
                              children: [
                                TextSpan(
                                    text: "Proximité : "
                                ),
                                TextSpan(
                                    text: "1.8km"
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
                        Text.rich(
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: TColor.smallTitle.withOpacity(0.55),
                              fontSize: 12
                          ),
                          TextSpan(
                              children: [
                                const TextSpan(
                                    text: "Téléphone : "
                                ),
                                TextSpan(
                                    text:  user.phoneNumber
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
                          width: TSizes.screenWidth*0.35,
                          child: Text("4/5 commande en cours", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: TColor.smallTitle.withOpacity(0.55),
                              fontSize: 12
                          ), overflow: TextOverflow.ellipsis,),
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
