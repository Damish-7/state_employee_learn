import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:state_employee_learn/db/model/patient_model.dart';


class EmployeeController extends GetxController{
    final RxList<EmployeeModel> employeeList = <EmployeeModel>[].obs;
    final RxBool isLoading = false.obs;
    RxString searchQuery = ''.obs;

    late Box<EmployeeModel> employeeBox;

    @override
      void onInit() {
        super.onInit();
        employeeBox = Hive.box<EmployeeModel> ('employee_db');
        getAllEmployees();
      }

      Future<void> addEmployee(EmployeeModel employee) async {
        isLoading.value = true;
         final id = await employeeBox.add(employee);
         employee.id = id;
         await employeeBox.put(id,employee);

         getAllEmployees();
          isLoading.value = false;
      }
       
       void getAllEmployees(){
        employeeList.assignAll(employeeBox.values.toList());
       }

      Future<void> deleteEmployee(int id) async {
        await employeeBox.delete(id);
        getAllEmployees();
      }

      Future<void> updateEmployee(int id, EmployeeModel employee)async {
        await employeeBox.put(id, employee);
        getAllEmployees();
      }
}