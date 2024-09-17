import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key, required this.pageTitle,  this.child}) : super(key: key);

  final String pageTitle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: kToolbarHeight,
        left: TSizes.width15,
        right: TSizes.width15
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.asset(
                  TImages.backIcon,
                  width: 35,
                ),
              ),
              const SizedBox(width: TSizes.smallSize,),
              Text(pageTitle, style: Theme.of(context).textTheme.titleMedium,),
            ],
          ),
          SizedBox(height: TSizes.height20,),
          child ?? const SizedBox()
        ],
      ),
    );
  }
}
