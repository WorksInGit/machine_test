import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/model/requirement_model.dart';
import 'dart:convert';

class RequirementController extends GetxController {
  var isLoading = true.obs;
  var requirementList = <Requirement>[].obs;

  // Use the provided token
  final String bearerToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNDFiODAxMmQ1YWNkOTk1MGVlZjY0YmMwNTBmOWE5MjgwZDhmYzAzZjQxY2I2NTEzOTA1YzQxYjRlMjZkZWI1MTU1YTkwNTNjYWVjYzJjOTAiLCJpYXQiOjE3MjY2MzYyNTIuMDc5ODQ5LCJuYmYiOjE3MjY2MzYyNTIuMDc5ODUxLCJleHAiOjE3NTgxNzIyNTIuMDcwMzQsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.TUFYQ2JVwgcvprH56N968QiWMyMz51la7T0pKDsMaqonwsMskQkHjSKhGsrP4EKxiZzc18fhWZ2aytEHysm_CLjJM-OPjEkt3VD-BGdko1QOPMeGzFmAlgYIdsorwvYBIr4j3hbnPk28zeqY8HPWqZ5cByAz_qAFSnfRHxd0pefiI_JWqWvsVeB3dfjN7jxEnC25b9LRLoGz4SCfElC4H31WnHBSMDVEMJ6_UuGy0fopurgjJIVjAWkP-pusfwTcGGUDlGTPxrsS4pA5V3zYNP7AUs_n5kkPx7tWEGezj7TJe4rO_wri7Bqe2NzqKLuG8L-GTKX4FEQSjn7NdGBfFRWGoL0UPlICmrKZe5kodCwK7WpYJkD0YNY3D-Q1baNkugGcQKy3_tOHsX_qlCZkho6eDDMV1C3qhj3GDMAv2Z3syWpQtabfyM3tdF4ngaLtJYVmV1bHN3KEn0aXBbryaY7FNKSsVgcVie0p8SmoAg_3G_yKBnlYBViD6bhLVD-gQ-MGC2bZZ0zlAG91pO4IsiXT8NuSSpP6fv7YqfG-MJ0O7KokyoRxJUpEh-c0JJmBHt-UrOucPl9vJHGC_doyJu1WIJREMbFz-46rKSoKRK4Xt3djiuLqFsyYG9CXTvEIkh5rweFRJVv6Iuo3OXW-1KPOmoBLPdACgmtgUYQkSzU';

  @override
  void onInit() {
    fetchRequirements();
    super.onInit();
  }

  // Fetch data from the API
  Future<void> fetchRequirements() async {
  try {
    final response = await http.get(
      Uri.parse('https://test.vehup.com/api/get-vendor-requirements'),
      headers: {
        'Authorization': 'Bearer $bearerToken', // Include the Bearer token
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      if (responseData['data'] != null && responseData['data'].isNotEmpty) {
        var data = responseData['data'] as List;
        requirementList.value = data.map((item) => Requirement.fromJson(item)).toList();
      } else {
        Get.snackbar('Info', 'No requirements available');
      }
    } else {
      Get.snackbar('Error', 'Failed to load data');
    }
  } catch (e) {
    Get.snackbar('Error', 'An error occurred: $e');
  } finally {
    isLoading.value = false;
  }
}
}