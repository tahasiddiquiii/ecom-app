import 'package:get/get.dart';

import '../../../../../retrofit/network/api_services.dart';
import '../model/product_detail_model.dart';
import '../model/top_products_model.dart';

class ProductDetailController extends GetxController {
  RxBool isLoading = false.obs;

  ProductDetailModel? _productDetailModel;
  ProductDetailModel? get productDetailModel => _productDetailModel;

  getProducttDetail(String productId) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().getProductDetail(productId);

      _productDetailModel = ProductDetailModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
