import 'package:adms/common/widget/nav_bar/nab_bar_page.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import '../../common/widget/loader/loader.dart';


class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarPage(
      child: Scaffold(
        body: Center(
            child: HasErrorWidget(action: () {
              //goToNamed(TRoute.deliveredAndEchecOrder);
            }, title: '', actionText: 'Non disponible',)
        ),
      ),
    );
  }
}
