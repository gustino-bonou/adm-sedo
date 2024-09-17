import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';

class CourseDetailItem extends StatelessWidget {
  const CourseDetailItem({Key? key, required this.title, required this.detail}) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 2
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CircleAvatar(
            backgroundColor: Colors.white,
            radius: TSizes.height10,
             child: Center(
               child: CircleAvatar(
                 backgroundColor: Colors.black87,
                 radius: 3,
               ),
             ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: TColor.smallTitle.withOpacity(0.8),
                      fontSize: TSizes.ft12
                  ),
                  TextSpan(
                      children: [
                        TextSpan(
                            text: "$title : "
                        ),
                        TextSpan(
                            text: detail
                        ),
                      ]
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
