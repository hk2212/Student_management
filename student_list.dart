import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/views/add_student.dart';
import 'edit_student.dart';
import '../controller/student_controller.dart';
import '../models/student.dart'; 


class StudentList extends StatelessWidget {
  final StudentController _studentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Management'),
      ),
      body: Obx(
        () => ListView.builder(
          
          itemCount: _studentController.students.length,
          itemBuilder: (context, index) {
            Student student = _studentController.students[index];
            return ListTile(
              title: Text(student.name),
              subtitle: Text('Age: ${student.age}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Get.to(() => EditStudent(index: index));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _studentController.students.removeAt(index);
                      _studentController.update();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddStudent());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}




