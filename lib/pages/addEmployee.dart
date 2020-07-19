import 'package:DummyApp/models/employee.dart';
import 'package:DummyApp/services/employeeOperation.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        //padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          children: <Widget>[
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Employee Name',
                prefixIcon: Icon(Icons.people),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              textCapitalization: TextCapitalization.words,
              controller: postController,
              decoration: InputDecoration(
                hintText: 'Employee Post',
                prefixIcon: Icon(Icons.business),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.phone,
              controller: salaryController,
              decoration: InputDecoration(
                hintText: 'Employee Salary',
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 8),
            RaisedButton(
              child: Text('Add Employee'),
              onPressed: () {
                String name = nameController.text;
                String post = postController.text;
                int salary = int.parse(salaryController.text);

                Employee employee =
                    Employee(name: name, post: post, salary: salary);

                EmployeeOperation.addEmployee(employee);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
