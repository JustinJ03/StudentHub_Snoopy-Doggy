// ============================================================================
// File: stud_info.dart
// Description: Student Details Page — displays a selected student's
//              detailed information.
//
// REQUIREMENT 3: Student Details Page
//   - When a user selects a student from the list (stud_list.dart),
//     display the student's detailed information on this page.
//   - Use appropriate widgets to organise the content (Card, Column, Row).
//   - Include SelectableText for matric number and email address
//     so users can select and copy them.
//
// INSTRUCTIONS FOR DEVELOPER:
//   1. This page receives a Student object from stud_list.dart
//      via Navigator.push constructor parameter.
//   2. Display the following student details:
//       - Name (Text)
//       - Matric Number (SelectableText — REQUIRED)
//       - Programme
//       - Email (SelectableText — REQUIRED)
//       - Phone
//       - Faculty
//       - Year of Study
//       - CGPA
//   3. Use a profile header section (CircleAvatar with student initials).
//   4. Use Cards to organise sections (Personal Info, Academic Info).
//
// NOTE: This page does NOT need Riverpod since it receives data
//       via constructor. But you may use ConsumerWidget if needed.
//
// EXAMPLE SNIPPET:
//   SelectableText(
//     student.matricNumber,
//     style: const TextStyle(fontSize: 16),
//   )
//
//   SelectableText(
//     student.email,
//     style: const TextStyle(fontSize: 16, color: Colors.blue),
//   )
//
// NAVIGATION:
//   This page is pushed from stud_list.dart using:
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => StudentInfoPage(student: student),
//     ),
//   );
// ============================================================================

import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentInfoPage extends StatelessWidget {
  final Student student;

  const StudentInfoPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the Student Details Page
    // Display all student details using Cards and appropriate widgets.
    // Use SelectableText for matricNumber and email.

    return Scaffold(
      appBar: AppBar(title: Text(student.name)),
      body: const Center(
        child: Text(
          'Student Details Page\n(To be implemented)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
