import 'package:get/get.dart';
import '../models/student.dart';

class StudentController extends GetxController {
  final students = <Student>[].obs;

  void addStudent(Student student) {
    students.add(student);
    update();
  }
}
