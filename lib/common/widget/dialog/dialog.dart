import 'package:adms/common/widget/buttons/button_component.dart';
import 'package:adms/common/widget/loader/loader.dart';
import 'package:adms/utils/helper/import.app.path.dart';

void openSmoothTextFormDialog({
  required Function(String) onSubmit,
  required TextEditingController controller,
  required String title,
  required String actionMessage,
  required BuildContext context
}) {
  Get.dialog(
      barrierDismissible: true,
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            decoration: const BoxDecoration(
              color: TColor.kcPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24)
              )
            ),
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            const SizedBox(height: 16),
            Text(actionMessage),
            const SizedBox(height: 25),
            TextFormField(
              controller: controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer le nom';
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleOutlineNextButton(
                  buttonColor: Colors.white,
                  textColor: TColor.kcPrimaryColor,
                  text: "Annuler",
                  onPressed: () {
                    Get.back();
                  },
                  canDoAction: true,
                ),
                SimpleButton(
                    text: "Enregistrer",
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      onSubmit(controller.text);
                      Get.back();
                    } else {

                      TLoaders.errorSnackBar(title: 'Erreur', message: 'Veuiller entrer votre nom');
                    }
                  },
                  canDoAction: true,
                ),
              ],
            ),
          ],),)
        ],
      ),
    ),
    transitionDuration: const Duration(milliseconds: 500),
    transitionCurve: Curves.easeInOut,
  );
}