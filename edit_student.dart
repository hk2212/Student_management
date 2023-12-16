import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/student_controller.dart';
import '../models/student.dart';

class EditStudent extends StatelessWidget {
  final StudentController _studentController = Get.find();
  final int index;

  EditStudent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: _studentController.students[index].name);
    final TextEditingController ageController = TextEditingController(
        text: _studentController.students[index].age.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
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
                  _studentController.students[index] =
                      Student(name: name, age: age);
                  _studentController.update();
                  Get.back();
                } else {
                  // Show error message
                  Get.snackbar('Error', 'Invalid input');
                }
              },
              child: Text('Update Student'),
            ),
          ],
        ),
      ),
    );
  }
}
