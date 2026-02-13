import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_employee_learn/db/controller/employee_controller.dart';
import 'package:state_employee_learn/db/model/employee_model.dart';


class EmployeeListWidget extends StatelessWidget {
   EmployeeListWidget({super.key});

  final EmployeeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
   return Obx(() {
  final employees = controller.filtereedEmployees;

  if (employees.isEmpty) {
    return const Center(child: Text('No employee found'));
  }

  return ListView.builder(
    itemCount: employees.length,
    itemBuilder: (_, index) {
      final employee = employees[index];

      return ListTile(
        title: Text(employee.name),
        subtitle: Text('${employee.department} - ${employee.phone}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _editEmployee(context, employee),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => controller.deleteEmployee(employee.id!),
            ),
          ],
        ),
      );
    },
  );
});

  }

  void _editEmployee(BuildContext context, EmployeeModel employees){
    final nameController = TextEditingController(text: employees.name);
    final departmentController = TextEditingController(text: employees.department);
    final phoneController = TextEditingController(text: employees.phone);

    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: const Text('Edit Employee'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController),
            TextField(controller: departmentController),
            TextField(controller: phoneController),
          ],
        ),

        actions: [
          TextButton(onPressed: Get.back, child: const Text('cancel')),
          ElevatedButton(
            onPressed: () {
             controller.updateEmployee(
              employees.id == null ? 0 : employees.id!,
              EmployeeModel(
                id: employees.id!,
                name: nameController.text.trim(),
                 department: departmentController.text.trim(),
                  phone: phoneController.text.trim(),
                  ),
              );
              Get.back();
          },
           child: const Text('update'),
           ),
        ],
      )
      );
  }
}