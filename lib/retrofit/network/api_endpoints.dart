class AppApiEndpoints {
  //Base URL:
  static const String baseUrl = "https://sanjay-tiwari-backend.vercel.app";
  static const String _authResource = "/api/";

  //Login Module
  static const String loginUrl = "$baseUrl${_authResource}login";
  // static const String verifyOtpUrl = "$baseUrl${_authResource}app/verifyOTP/";
  // static const String resendOtpUrl = "$baseUrl${_authResource}app/resendOtp/";

  //wishlist
  static const String wishListUrl = "$baseUrl${_authResource}wishlist/";
  static const String addWishListUrl = "$baseUrl${_authResource}wishlist/add";
  static const String removeWishListUrl =
      "$baseUrl${_authResource}wishlist/remove";

  //Product
  static const String topProductsUrl =
      "$baseUrl${_authResource}productList/get";
  static const String productDetailUrl =
      "$baseUrl${_authResource}product/getbyId/";

  //cart
  static const String cartItemsUrl = "$baseUrl${_authResource}viewCart/";
  static const String addToCartUrl = "$baseUrl${_authResource}addToTruck";
  static const String removeFromCartUrl = "$baseUrl${_authResource}remove";
  static const String editCartItemsUrl = "$baseUrl${_authResource}editCart";
}
