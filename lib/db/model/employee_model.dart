import 'package:hive_flutter/adapters.dart';
part 'employee_model.g.dart';

@HiveType(typeId: 1)
class EmployeeModel{

  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String department;

  @HiveField(3)
  final String phone;

  EmployeeModel({
    this.id,
    required this.name,
    required this.department,
    required this.phone,
  });

}