import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_employee_learn/db/controller/employee_controller.dart';
import 'package:state_employee_learn/db/model/employee_model.dart';

class AddEmployeeWidget extends StatelessWidget {
      AddEmployeeWidget({super.key});


  final namecontroller = TextEditingController();
  final departmentcontroller = TextEditingController();
  final phonecontroller = TextEditingController();

  final EmployeeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          
          TextField(controller: namecontroller, decoration: const InputDecoration(labelText: "Name"),),
          const SizedBox(height: 10),
          TextField(controller: departmentcontroller, decoration: const InputDecoration(labelText: "Department"),),
          const SizedBox(height: 10),
          TextField(controller: phonecontroller, decoration: const InputDecoration(labelText: "Phone"),),
          const SizedBox(height: 10),

          Obx(() => ElevatedButton(
            onPressed: controller.isLoading.value 
            ? null
            : () {
              controller.addEmployee(
               EmployeeModel(
                name: namecontroller.text.trim(),
                department: departmentcontroller.text.trim(),
                phone: phonecontroller.text.trim(),
              ),
              );

              namecontroller.clear();
              departmentcontroller.clear(); 
              phonecontroller.clear();
              
              },
            
            child: controller.isLoading.value
            ? const SizedBox(
              height: 20,
              width: 20,
               child: CircularProgressIndicator(strokeWidth: 2),
            )   
            : const Text('Add Employee'),
            )), 

        ],
      ),
    );

  }
}