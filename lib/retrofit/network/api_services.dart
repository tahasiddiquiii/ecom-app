import 'dart:convert';

import '../local/local_services.dart';
import 'api_endpoints.dart';
import '../../retrofit/network/dio_client.dart';

class ApiServices {
  DioClient dio = DioClient();

  var token = LocalServices.getToken();

  login(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.loginUrl,
        data: jsonEncode(data),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  getWishList(String loginId) async {
    try {
      var response = await dio.get(
        "${AppApiEndpoints.wishListUrl}$loginId",
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  addWishList(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.addWishListUrl,
        data: jsonEncode(data),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  removeWishList(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.removeWishListUrl,
        data: jsonEncode(data),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  getTopProducts(String page, String limit) async {
    try {
      var response = await dio.get(
        "${AppApiEndpoints.topProductsUrl}?page=$page&limit=$limit",
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  getProductDetail(String productId) async {
    try {
      var response = await dio.get(
        "${AppApiEndpoints.productDetailUrl}$productId",
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  getCartItems(String loginId) async {
    try {
      var response = await dio.get(
        "${AppApiEndpoints.cartItemsUrl}$loginId",
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  addToCart(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.addToCartUrl,
        data: jsonEncode(data),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  removeFromCart(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.removeFromCartUrl,
        data: jsonEncode(data),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  editCartItem(dynamic data) async {
    try {
      var response = await dio.post(
        AppApiEndpoints.editCartItemsUrl,
        data: jsonEncode(data),
      );
      if (response != null) {
        return response;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }
}
