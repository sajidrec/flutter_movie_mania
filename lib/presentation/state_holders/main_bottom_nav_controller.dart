import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  Future<void> changeIndex(int index) async {
    _selectedIndex = index;
    update();
  }
}
