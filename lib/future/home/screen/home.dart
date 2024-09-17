import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter/services.dart';
import '../../../common/widget/loader/loader.dart';
import '../../../common/widget/nav_bar/nab_bar_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        // Ask the user for confirmation before navigating back
        bool confirm = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('Voulez-vous quitter l\'application ?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Non'),
                ),
                TextButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Oui'),
                ),
              ],
            );
          },
        );

        // Return true if the user confirms, otherwise return false
        return confirm ?? false;
      },
      child: NavBarPage(
        child: Center(
            child: HasErrorWidget(action: () {
              // goToNamed(TRoute.inProgressAnPendingOrder);
            }, title: '', actionText: 'Non disponible',)
        ),
      ),
    );
  }
}
