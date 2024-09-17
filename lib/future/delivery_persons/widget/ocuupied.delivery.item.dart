




import 'package:adms/future/authentication/model/user.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widget/rating/custom.rating.dart';

class OccupiedDeliveryItem extends StatelessWidget {
  const OccupiedDeliveryItem({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                          width: TSizes.screenWidth*0.45,
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
                        GestureDetector(
                          onTap: () => goToNamed(TRoute.deliveryPersonDetail, {'user' : user}),
                          child: Text(
                              "Voir",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: const Color(0xFF404040),
                                fontSize: TSizes.ft14,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.fade,
                              )
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8,),
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
                                text: user.phoneNumber
                            ),
                          ]
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: TSizes.screenWidth*0.35,
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



      Container(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: TSizes.screenWidth*0.45,
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
                    GestureDetector(
                      onTap: () {
                        // Add your onTap functionality here
                      },
                      child: Text(
                          "Voir",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: const Color(0xFF404040),
                            fontSize: TSizes.ft14,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.fade,
                          )
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
                          color: TColor.smallTitle.withOpacity(0.55),
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
                      width: TSizes.screenWidth*0.45,
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
          ],
        )
    );
  }
}
