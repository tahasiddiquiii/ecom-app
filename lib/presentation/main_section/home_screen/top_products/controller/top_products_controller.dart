import 'package:get/get.dart';

import '../../../../../retrofit/network/api_services.dart';
import '../model/top_products_model.dart';

class TopProductsController extends GetxController {
  RxBool isLoading = false.obs;

  TopProductsModel? _topProductsModel;
  TopProductsModel? get topProductsModel => _topProductsModel;

  getTopProducts(String page, String limit) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().getTopProducts(page, limit);

      _topProductsModel = TopProductsModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
