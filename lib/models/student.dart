/// ============================================================================
/// File: student.dart
/// Description: Student data model used across the application.
/// This model defines the Student class with all relevant fields.
/// ============================================================================

class Student {
  final String name;
  final String matricNumber;
  final String programme;
  final String email;
  final String phone;
  final String faculty;
  final int year;
  final double cgpa;
  final String avatarUrl; // Icon label or asset path

  const Student({
    required this.name,
    required this.matricNumber,
    required this.programme,
    required this.email,
    required this.phone,
    required this.faculty,
    required this.year,
    required this.cgpa,
    this.avatarUrl = '',
  });
}
