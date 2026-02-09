import 'package:flutter/material.dart';
import 'package:state_employee_learn/screens/widgets/add_employee_widget.dart';
import 'package:state_employee_learn/screens/widgets/employee_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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