import 'package:adms/utils/helper/import.app.path.dart';
import 'bottom.nav.bar.dart';

class NavBarPage extends StatelessWidget {
  final Widget child;
  const NavBarPage({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(),
    );
  }
}