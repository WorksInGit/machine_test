import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:machine_test/views/bottom_nav.dart';

class LoginController extends GetxController {

  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  Future<void> login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar('Error', 'Please fill in both fields');
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse('https://test.vehup.com/api/vendor-login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': email.value,
          'password': password.value,
        }),
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        var token = responseData['token']; 
        var userData = responseData['data'];
        Get.offAll(() => BottomNav());
      } else {
        Get.snackbar('Error', 'Failed to login, please try again');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
