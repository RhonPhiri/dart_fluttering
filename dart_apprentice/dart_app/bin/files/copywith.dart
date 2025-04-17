//Created a student class that will be assigned to a student
class Student {
  String fullName;
  int studentId;
  String course;

  Student(
      {required this.fullName, required this.studentId, this.course = 'BDS 1'});

  Student copyWith({String? fullName, int? studentId, String? course}) {
    return Student(
        fullName: fullName ?? this.fullName,
        studentId: studentId ?? this.studentId,
        course: course ?? this.course);
  }

  @override
  String toString() {
    return 'Name: $fullName, Id: $studentId, Course: $course';
  }
}

void main() {
  final student1 = Student(fullName: 'Rhon Phiri', studentId: 202220140020);
  //instead of a calling a new instance of student, I have assigned the
  //student1 to student2, having its properties and values maintained
  final student2 = student1;
  //when a property in student2 is changed as below;
  student2.fullName = 'Chimango Phiri';
  //both students show the same name
  //but to prevent this, one can create a method known as copywith, which
  //when called, either retains the original properties and values or a
  //new value
  print('student1: $student1');
  print('student2: $student2');
  final student3 = student1.copyWith(fullName: 'Nohr Phiri');
  print('////');
  print('Student 1: $student1');
  print('Student 2: $student2');
  print('Student 3: $student3');
}
