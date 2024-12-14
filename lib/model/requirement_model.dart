class Requirement {
  final int id;
  final String year;
  final String status;
  final String vehicleType;
  final String brand;
  final String vehicleModel;
  final String vehicleVariant;
  final String transmission;
  final String fuelType;
  final String vehicleColor;

  Requirement({
    required this.id,
    required this.year,
    required this.status,
    required this.vehicleType,
    required this.brand,
    required this.vehicleModel,
    required this.vehicleVariant,
    required this.transmission,
    required this.fuelType,
    required this.vehicleColor,
  });

  factory Requirement.fromJson(Map<String, dynamic> json) {
    return Requirement(
      id: json['id'],
      year: json['year'],
      status: json['status'],
      vehicleType: json['vehicle_type']['name'],
      brand: json['brand']['name'],
      vehicleModel: json['vehicle_model']['name'],
      vehicleVariant: json['vehicle_variant']['name'],
      transmission: json['transmission']['name'],
      fuelType: json['fuel_type']['name'],
      vehicleColor: json['vehicle_color']['name'],
    );
  }
}