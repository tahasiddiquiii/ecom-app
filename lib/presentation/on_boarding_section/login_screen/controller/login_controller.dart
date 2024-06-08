import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../retrofit/local/local_db.dart';
import '../../../../retrofit/network/api_services.dart';
import '../model/auth_model.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoginFail = false.obs;

  RxString selectedValue = 'Login'.obs;

  changingSelectedOption(String login) {
    selectedValue.value = login;
  }

  AuthModel? _authModel;
  AuthModel? get authModel => _authModel;

  Future<AuthModel?> loginApi(
    BuildContext context,
    String mobileNumber,
  ) async {
    isLoading.value = true;
    isLoginFail.value =
        false; // Reset the login fail status before making the request
    try {
      var response = await ApiServices().login(
        {"mobile": mobileNumber},
      );

      _authModel = AuthModel.fromJson(response);
      print("#################################");
      print(authModel!.message);
      print(authModel!.data!.id);
      if (authModel!.token != null) {
        LocalDB.saveString("token", authModel!.data!.otp!);
        isLoading.value = false;
        isLoginFail.value = false; // Login was successful
        return authModel;
      } else {
        isLoading.value = false;
        isLoginFail.value = true; // Login failed
        return null;
      }
    } catch (e) {
      isLoading.value = false;
      isLoginFail.value = true; // Login failed due to an exception
      print(e);
      return null;
    }
  }
}
