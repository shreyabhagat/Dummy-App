import 'package:DummyApp/models/employee.dart';
import 'package:DummyApp/pages/addEmployee.dart';
import 'package:DummyApp/pages/editEmployee.dart';
import 'package:DummyApp/services/employeeOperation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Employee'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddEmployee(),
            ),
          );
          setState(() {});
        },
      ),
      body: employeeList.length == 0
          ? Center(
              child: Text('No Employee'),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: ListView.builder(
                itemCount: employeeList.length,
                itemBuilder: (BuildContext context, int index) {
                  Employee e = employeeList[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(e.name[0])),
                    title: Text(e.name),
                    subtitle: Text('${e.post}  ${e.salary}/-'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            AlertDialog obj = AlertDialog(
                              title: Text(
                                'Waring',
                                style: TextStyle(color: Colors.red),
                              ),
                              content: Text('Do you really want to delete?'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('yes'),
                                  onPressed: () {
                                    EmployeeOperation.deleteEmployee(index);
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                ),
                                FlatButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => obj,
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => EditEmployee(
                                  employee: e,
                                  index: index,
                                ),
                              ),
                            );
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
