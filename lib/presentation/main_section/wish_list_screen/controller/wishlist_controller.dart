import 'package:get/get.dart';

import '../../../../retrofit/network/api_services.dart';
import '../../../on_boarding_section/login_screen/model/auth_model.dart';
import '../model/wishlist_model.dart';

class WishlistController extends GetxController {
  RxBool isLoading = false.obs;

  WishListModel? _wishListModel;
  WishListModel? get wishListModel => _wishListModel;

  getWishList(String loginId) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().getWishList(loginId);

      _wishListModel = WishListModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
