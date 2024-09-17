import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';

class NotificationArticleItems extends StatelessWidget {
  const NotificationArticleItems({Key? key, required this.articleNames}) : super(key: key);

  final List<String> articleNames ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 2
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: TSizes.height10,
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 3,
                  ),
                ),
                const SizedBox(width: TSizes.tinySize,),
                Text(
                  'Articles à livrer : ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: TColor.smallTitle.withOpacity(0.8),
                      fontSize: TSizes.ft12
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: TSizes.width10,
            ),
            child: Column(
              children: [
                ...articleNames.map((article) => Row(
                  children: [
                     Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: TSizes.height10,
                        child: const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 3,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        article,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: TColor.smallTitle.withOpacity(0.8),
                          fontSize: TSizes.ft12,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          )
        ],
      )
    );
  }
}
