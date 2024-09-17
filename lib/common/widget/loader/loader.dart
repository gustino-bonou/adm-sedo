

import 'package:adms/utils/constants/images_string.dart';
import 'package:adms/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../utils/constants/colors.dart';
import '../buttons/button_component.dart';



class TLoaders {

  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            elevation: 0,
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.transparent,
            content: Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey
              ),
            ))
    );
  }
  static errorSnackBar({required title, message = '', }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: TColor.smallTitle,
      backgroundColor: Colors.white,
      borderColor: Colors.red,
      borderWidth: 2,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning, color: Colors.red, weight: 5,),
        titleText: Container(),
      messageText: Text(
        message,
        style: TextStyle(
            color: TColor.smallTitle,
            fontWeight: FontWeight.w600,
          fontSize: 12
        ),
      ),
    );
  }

  static successSnackBar({required context, message = '', duration = 3}){
    Get.snackbar(
      '',
      message,
      isDismissible: true,
      colorText: Colors.white,
      backgroundColor: TColor.kcPrimaryColor,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Icons.check_circle_outline, color: Colors.white,),
      titleText: Container(),
      messageText: Text(
        message,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }

  static warningSnackBar({required title, message = '', }){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Icons.warning, color: Colors.white,),
    );
  }




  static Future<void> successDialog(String? title, String? message, Function() action, BuildContext context, { String? actionText,}) async {
    await Get.dialog(
      transitionDuration: const Duration(milliseconds: 500),
        barrierDismissible: true,
      Dialog(
        insetPadding: EdgeInsets.all(TSizes.width10),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: TSizes.height15,
            horizontal: TSizes.width15
          ),
          height: TSizes.screenHeight*0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title?? "Félicitation", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  ), ),
                  Container(
                    margin: EdgeInsets.only(
                      top: TSizes.height15,
                    ),
                    child: Text(
                      message!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(top: TSizes.height20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SimpleButton(
                      canDoAction: true,
                      text: 'Continuer',
                      onPressed: (){
                       Get.back();
                       Future.delayed(const Duration(milliseconds: 500)).then((value) => action());
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget loadingIndicator() {
    return Container(
      color: Colors.black.withOpacity(0.5), // Couche semi-transparente
      child: Center(
        child: Container(
          height: TSizes.screenHeight,
          width: TSizes.screenWidth,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10)
          ),
          child: LoadingAnimationWidget.inkDrop(
            size: 100, color: TColor.kcPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class HasErrorWidget extends StatelessWidget {
  const HasErrorWidget({Key? key, required this.action, required this.title, required this.actionText}) : super(key: key);

  final Function() action;
  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(TSizes.width15),
      height: TSizes.screenHeight*0.4,
      child: Column(
        children: [
          Image.asset(TImages.error, height: TSizes.screenHeight*0.3,),
          SizedBox(height: TSizes.height20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              SizedBox(
                width: TSizes.screenWidth*0.5,
                child: SimpleOutlineNextButton(
                  canDoAction: true,
                  text: actionText , onPressed: () {
                  action();
                },),
              ),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
