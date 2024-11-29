import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // Private variables
  final RxInt _index = 0.obs;

  // Getters
  int get index => _index.value;

  // Setters
  set index(value) => _index.value = value;
}
