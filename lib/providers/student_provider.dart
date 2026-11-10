// ============================================================================
// File: student_provider.dart
// Description: Shared state management using Riverpod.
// Manages the student data list, selected navigation index,
// and any shared application state.
// Requirement 9: Shared State Management (Riverpod)
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/student.dart';

/// Top-level Riverpod provider — accessible anywhere via ref.watch / ref.read
final studentProvider =
    ChangeNotifierProvider<StudentNotifier>((ref) => StudentNotifier());

class StudentNotifier extends ChangeNotifier {
  // -------------------------------------------------------------------------
  // Navigation State
  // -------------------------------------------------------------------------
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // -------------------------------------------------------------------------
  // Student Data (Sample Data — 10+ records)
  // -------------------------------------------------------------------------
  final List<Student> _students = const [
    Student(
      name: 'Ahmad Danial bin Rosli',
      matricNumber: 'A22EC0001',
      programme: 'Software Engineering',
      email: 'danial@graduate.utm.my',
      phone: '011-1234567',
      faculty: 'Faculty of Computing',
      year: 3,
      cgpa: 3.75,
    ),
    Student(
      name: 'Nurul Aisyah binti Kamal',
      matricNumber: 'A22EC0012',
      programme: 'Data Engineering',
      email: 'aisyah@graduate.utm.my',
      phone: '012-2345678',
      faculty: 'Faculty of Computing',
      year: 2,
      cgpa: 3.88,
    ),
    Student(
      name: 'Muhammad Irfan bin Aziz',
      matricNumber: 'A22EC0023',
      programme: 'Computer Science (Network)',
      email: 'irfan@graduate.utm.my',
      phone: '013-3456789',
      faculty: 'Faculty of Computing',
      year: 3,
      cgpa: 3.50,
    ),
    Student(
      name: 'Siti Nurhaliza binti Mohd',
      matricNumber: 'A22EC0034',
      programme: 'Software Engineering',
      email: 'nurhaliza@graduate.utm.my',
      phone: '014-4567890',
      faculty: 'Faculty of Computing',
      year: 1,
      cgpa: 3.92,
    ),
    Student(
      name: 'Lee Wei Jie',
      matricNumber: 'A22EC0045',
      programme: 'Computer Science (Bioinformatics)',
      email: 'weijie@graduate.utm.my',
      phone: '015-5678901',
      faculty: 'Faculty of Computing',
      year: 4,
      cgpa: 3.60,
    ),
    Student(
      name: 'Priya a/p Ramasamy',
      matricNumber: 'A22EC0056',
      programme: 'Data Engineering',
      email: 'priya@graduate.utm.my',
      phone: '016-6789012',
      faculty: 'Faculty of Computing',
      year: 2,
      cgpa: 3.45,
    ),
    Student(
      name: 'Tan Chee Keong',
      matricNumber: 'A22EC0067',
      programme: 'Computer Science (Network)',
      email: 'cheekeong@graduate.utm.my',
      phone: '017-7890123',
      faculty: 'Faculty of Computing',
      year: 3,
      cgpa: 3.70,
    ),
    Student(
      name: 'Fatimah binti Abdullah',
      matricNumber: 'A22EC0078',
      programme: 'Software Engineering',
      email: 'fatimah@graduate.utm.my',
      phone: '018-8901234',
      faculty: 'Faculty of Computing',
      year: 2,
      cgpa: 3.82,
    ),
    Student(
      name: 'Rajesh a/l Kumar',
      matricNumber: 'A22EC0089',
      programme: 'Computer Science (Bioinformatics)',
      email: 'rajesh@graduate.utm.my',
      phone: '019-9012345',
      faculty: 'Faculty of Computing',
      year: 1,
      cgpa: 3.55,
    ),
    Student(
      name: 'Nur Amirah binti Hassan',
      matricNumber: 'A22EC0090',
      programme: 'Data Engineering',
      email: 'amirah@graduate.utm.my',
      phone: '011-0123456',
      faculty: 'Faculty of Computing',
      year: 4,
      cgpa: 3.95,
    ),
  ];

  List<Student> get students => List.unmodifiable(_students);

  int get totalStudents => _students.length;

  /// Get students filtered by programme
  List<Student> getStudentsByProgramme(String programme) {
    return _students.where((s) => s.programme == programme).toList();
  }

  /// Get list of unique programmes
  List<String> get programmes {
    return _students.map((s) => s.programme).toSet().toList()..sort();
  }

  /// Calculate average CGPA
  double get averageCgpa {
    if (_students.isEmpty) return 0.0;
    return _students.map((s) => s.cgpa).reduce((a, b) => a + b) /
        _students.length;
  }
}
