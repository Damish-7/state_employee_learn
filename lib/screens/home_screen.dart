import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_employee_learn/db/controller/employee_controller.dart';
import 'package:state_employee_learn/screens/widgets/add_employee_widget.dart';
import 'package:state_employee_learn/screens/widgets/employee_list_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final EmployeeController controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee manager')),
      body: Column(
        children: [
          AddEmployeeWidget(),
          Expanded(child: EmployeeListWidget()),
        ],
      ),
    );
  }
}