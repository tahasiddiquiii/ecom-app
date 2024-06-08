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

  // verifyOtp(dynamic data, String loginId) async {
  //   try {
  //     var response = await dio.post(
  //       "${AppApiEndpoints.verifyOtpUrl}$loginId",
  //       data: jsonEncode(data),
  //     );
  //     if (response != null) {
  //       return response;
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  //   return null;
  // }

  // resendOtp(String loginId) async {
  //   try {
  //     var response = await dio.post(
  //       "${AppApiEndpoints.resendOtpUrl}$loginId",
  //     );
  //     if (response != null) {
  //       return response;
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  //   return null;
  // }

  // postLeaveRequest(dynamic data) async {
  //   try {
  //     var response = await dio.post(
  //       AppApiEndpoints.leaveRequestUrl,
  //       data: data,
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );

  //     return response;
  //   } catch (error) {
  //     // Handle errors
  //     print("Error updating user profile: $error");
  //     rethrow;
  //   }
  // }

  // postaddEmployee(dynamic data) async {
  //   try {
  //     var response = await dio.post(
  //       AppApiEndpoints.addUserUrl,
  //       data: data,
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );

  //     return response;
  //   } catch (error) {
  //     // Handle errors
  //     print("Error updating user profile: $error");
  //     rethrow;
  //   }
  // }

  // getUserProfile() async {
  //   try {
  //     var response = await dio.get(
  //       AppApiEndpoints.getUserProfileUrl,
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );
  //     if (response != null) {
  //       return response;
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  //   return null;
  // }

  // postCheckIn(dynamic data) async {
  //   try {
  //     var response = await dio.post(
  //       AppApiEndpoints.checkInUrl,
  //       data: data,
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );

  //     return response;
  //   } catch (error) {
  //     // Handle errors
  //     print("Error updating user profile: $error");
  //     rethrow;
  //   }
  // }

  // postCheckOut(dynamic data) async {
  //   try {
  //     var response = await dio.post(
  //       AppApiEndpoints.checkOutUrl,
  //       data: data,
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );

  //     return response;
  //   } catch (error) {
  //     // Handle errors
  //     print("Error updating user profile: $error");
  //     rethrow;
  //   }
  // }

  // putRequestRegularization(dynamic data, attendanceId) async {
  //   try {
  //     var response = await dio.put(
  //       "${AppApiEndpoints.regularizationRequestUrl}$attendanceId",
  //       data: data,
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );

  //     return response;
  //   } catch (error) {
  //     // Handle errors
  //     print("Error updating user profile: $error");
  //     rethrow;
  //   }
  // }

  // getSiteVisitListReport() async {
  //   try {
  //     var response = await dio.get(
  //       AppApiEndpoints.getSiteVisitListReport,
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );
  //     if (response != null) {
  //       return response;
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  //   return null;
  // }
}
