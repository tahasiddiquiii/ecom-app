import 'package:ecommerce_seller/presentation/main_section/home_screen/cart/model/add_to_cart_model.dart';
import 'package:ecommerce_seller/presentation/main_section/home_screen/cart/model/edit_cart_model.dart';
import 'package:ecommerce_seller/presentation/main_section/home_screen/cart/model/remove_from_cart_model.dart';
import 'package:ecommerce_seller/presentation/main_section/home_screen/cart/model/view_cart_model.dart';
import 'package:get/get.dart';

import '../../../../../retrofit/network/api_services.dart';

class CartController extends GetxController {
  RxBool isLoading = false.obs;
  RxMap<int, int> quantities =
      <int, int>{}.obs; // key: item index, value: quantity
  RxBool avaliable = true.obs;
  RxString addToCartMessage = ''.obs;
  RxString removeFromCartMessage = ''.obs;

  AddToCartModel? _addToCartModel;
  AddToCartModel? get addToCartModel => _addToCartModel;

  EditCartModel? _editCartModel;
  EditCartModel? get editCartModel => _editCartModel;

  RemoveFromCartModel? _removeFromCartModel;
  RemoveFromCartModel? get removeFromCartModel => _removeFromCartModel;

  ViewCartModel? _viewCartModel;
  ViewCartModel? get viewCartModel => _viewCartModel;

  getCartItems(String buyerId) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().getCartItems(buyerId);
      _viewCartModel = ViewCartModel.fromJson(response);

      // Initialize quantities with the current quantities of items in the cart
      if (_viewCartModel?.cart?.items != null) {
        for (var i = 0; i < _viewCartModel!.cart!.items!.length; i++) {
          quantities[i] = _viewCartModel!.cart!.items![i].noOfPairs!;
        }
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  incQuantity(int index) {
    quantities[index] = (quantities[index] ?? 0) + 1;
  }

  decQuantity(int index) {
    if (quantities[index] != null && quantities[index]! > 1) {
      quantities[index] = quantities[index]! - 1;
    }
  }

  int getQuantity(int index) {
    return quantities[index] ?? 0;
  }

  addToCart(
      String buyerId, String productId, int noOfPairs, String size) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().addToCart({
        "BuyerId": buyerId,
        "productId": productId,
        "noOfPairs": noOfPairs,
        "size": size,
      });

      _addToCartModel = AddToCartModel.fromJson(response);

      addToCartMessage.value = _addToCartModel!.message ?? 'server err';

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  removeFromCart(String buyerId, String productId) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().removeFromCart({
        "BuyerId": buyerId,
        "productId": productId,
      });

      _removeFromCartModel = RemoveFromCartModel.fromJson(response);

      removeFromCartMessage.value =
          _removeFromCartModel!.message ?? 'server err';
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  editCart(String buyerId, String productId, int noOfPairs, String size) async {
    isLoading.value = true;

    try {
      var response = await ApiServices().editCartItem({
        "BuyerId": buyerId,
        "productId": productId,
        "noOfPairs": noOfPairs,
        "size": size,
      });

      _editCartModel = EditCartModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }
}
