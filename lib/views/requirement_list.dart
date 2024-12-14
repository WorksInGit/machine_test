import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/requirement_controller.dart';


class RequirementList extends StatelessWidget {
  const RequirementList({super.key});

  @override
  Widget build(BuildContext context) {
    final RequirementController controller = Get.put(RequirementController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Requirement List',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.requirementList.isEmpty) {
          return Center(child: Text('No requirements available.'));
        }

        return ListView.builder(
          itemCount: controller.requirementList.length,
          itemBuilder: (context, index) {
            var requirement = controller.requirementList[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vehicle Type: ${requirement.vehicleType}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Brand: ${requirement.brand}'),
                    Text('Model: ${requirement.vehicleModel}'),
                    Text('Variant: ${requirement.vehicleVariant}'),
                    Text('Transmission: ${requirement.transmission}'),
                    Text('Fuel Type: ${requirement.fuelType}'),
                    Text('Color: ${requirement.vehicleColor}'),
                    Text('Year: ${requirement.year}'),
                    Text('Status: ${requirement.status}'),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}