import 'package:flutter/material.dart';

class AddEmployeeWidget extends StatelessWidget {
      AddEmployeeWidget({super.key});


  final namecontroller = TextEditingController();
  final departmentcontroller = TextEditingController();
  final phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          
          TextField(controller: namecontroller, decoration: const InputDecoration(labelText: "Name"),),
          SizedBox(height: 10),
          TextField(controller: departmentcontroller, decoration: const InputDecoration(labelText: "Department"),),
          SizedBox(height: 10),
          TextField(controller: phonecontroller, decoration: const InputDecoration(labelText: "Phone"),),
          SizedBox(height: 10),

          ElevatedButton(onPressed: (){}, child: const Text("Add Employee"))


        ],
      ),
    );
  }
}