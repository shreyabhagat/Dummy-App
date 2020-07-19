import 'package:DummyApp/models/employee.dart';

class EmployeeOperation {
  static void addEmployee(Employee employee) {
    employeeList.add(employee);
  }

  static void deleteEmployee(int index) {
    employeeList.removeAt(index);
  }

  static void editEmployee(Employee employee, int index) {
    employeeList.removeAt(index);
    employeeList.insert(index, employee);
  }
}
