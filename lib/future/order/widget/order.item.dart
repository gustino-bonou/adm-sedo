
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widget/rating/custom.rating.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key,}) : super(key: key);

 // final User user;

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
            SizedBox(

              child: Center(
                  child: SvgPicture.asset(
                    TImages.bagFill,
                    color: TColor.smallTitle,
                    height: 64,
                    width: 56,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.modulate,
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
                          width: TSizes.screenWidth*0.5,
                          child: Text(
                            "Commandes: #78901",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: TColor.smallTitle,
                              fontSize: TSizes.ft14,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                            "Voir",
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: const Color(0xFF404040),
                              fontSize: TSizes.ft14,
                              fontWeight: FontWeight.w500,
                            )
                        )
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
                          const TextSpan(
                              children: [
                                TextSpan(
                                    text: "Client : "
                                ),
                                TextSpan(
                                    text: "Jean Dupont "
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
                            const TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Coursier : "
                                  ),
                                  TextSpan(
                                      text: "Paul Martin"
                                  ),
                                ]
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const StarRating(rating: 5),
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