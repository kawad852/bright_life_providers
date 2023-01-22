
import 'package:get/get.dart';

import '../../api/pages/pages.dart';
import '../../models/pages/page_model.dart';

class PagesCtrl extends GetxController{
  static PagesCtrl get find => Get.find();

  PageModel? pageModel;
  late Future<PageModel?> initializePageFuture;

  Future<PageModel?> fetchPage({required String slug}) async {
    pageModel = await PagesApi().data(slug: slug);
    return pageModel;
  }

}