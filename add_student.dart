import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/student_controller.dart';
import '../models/student.dart';


class AddStudent extends StatelessWidget {
  final StudentController _studentController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name',),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String name = nameController.text;
                final int age = int.tryParse(ageController.text) ?? 0;

                if (name.isNotEmpty && age > 0) {
                  _studentController.addStudent(Student(name: name, age: age));
                  Get.back();
                } else {
                  // Show error message
                  Get.snackbar('Error', 'Invalid input');
                }
              },
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}
