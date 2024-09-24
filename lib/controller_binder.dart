import 'package:get/get.dart';
import 'package:movie_mania/presentation/state_holders/home_screen_controller.dart';
import 'package:movie_mania/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:movie_mania/presentation/state_holders/search_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(HomeScreenController());
    Get.put(SearchScreenController());
  }
}
