import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:state_employee_learn/db/model/employee_model.dart';
import 'package:state_employee_learn/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(1)){
    Hive.registerAdapter(EmployeeModelAdapter());
  }
  await Hive.openBox<EmployeeModel>('employee_db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen() ,
    );
  }
}
