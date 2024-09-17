import 'package:adms/future/authentication/model/user.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import '../../../common/widget/loader/loader.dart';
import '../../../data/repositories/auth.repository.dart';

class OccupiedDeliveryPersonController extends GetxController {
  static OccupiedDeliveryPersonController get instance => Get.find();

  final AuthRepository authRepository;

  OccupiedDeliveryPersonController({required this.authRepository});

  String errorMessage = '';
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  RxList<User> userList = <User>[].obs;
  RxList<User> filteredList = <User>[].obs;
  RxInt currentPage = 1.obs;


  Future<void> getOccupiedDP() async {
    isLoading.value = true;
    Response response = await authRepository.getOccupiedDeliveryPersons();
    if (response.statusCode == 200) {
      hasError.value =  false;
      List<dynamic> jsonData = response.body;
      List<User> users = jsonData.map((json) => User.fromJson(json)).toList();
      userList.addAll(users);
      filteredList.value = userList;
      isLoading.value = false;
    } else {
      hasError.value =  true;
      isLoading.value = false;
      if (response.statusCode == 404) {
        errorMessage = "Aucun coursier trouvé";
      } else {
        errorMessage =
            "Une erreur s'est produite lors de la récupération des données.";
      }
      TLoaders.errorSnackBar(title: "Coursiers", message: errorMessage);
    }
  }

  void getData() {
    userList.clear();
    filteredList.clear();
    currentPage.value = 1;
    getOccupiedDP();
  }

  void goToDetailScreen() {
    goToNamed(TRoute.deliveryPersonDetail);
  }

  @override
  void onInit() async{
    super.onInit();
    getData();
  }
}
