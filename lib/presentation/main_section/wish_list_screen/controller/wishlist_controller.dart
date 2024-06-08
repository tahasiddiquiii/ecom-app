import 'package:get/get.dart';

import '../../../../retrofit/network/api_services.dart';
import '../../../on_boarding_section/login_screen/model/auth_model.dart';
import '../model/add_wishlist_model.dart';
import '../model/wishlist_model.dart';

class WishlistController extends GetxController {
  RxBool isLoading = false.obs;

  WishListModel? _wishListModel;
  WishListModel? get wishListModel => _wishListModel;

  AddRemoveWishListModel? _addWishListModel;
  AddRemoveWishListModel? get addWishListModel => _addWishListModel;

  AddRemoveWishListModel? _removeWishListModel;
  AddRemoveWishListModel? get removeWishListModel => _removeWishListModel;

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

  addWishList(
    String buyerId,
    String productId,
  ) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().addWishList({
        "buyerId": buyerId,
        "productId": productId,
      });

      _addWishListModel = AddRemoveWishListModel.fromJson(response);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  removeWishList(
    String buyerId,
    String productId,
  ) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().removeWishList({
        "buyerId": buyerId,
        "productId": productId,
      });

      _removeWishListModel = AddRemoveWishListModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
