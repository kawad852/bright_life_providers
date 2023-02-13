import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBarCtrl extends GetxController{
  static NavBarCtrl get find => Get.find();
  final PersistentTabController navBarController = PersistentTabController(initialIndex: 0);
}