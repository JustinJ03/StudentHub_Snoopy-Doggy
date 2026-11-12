import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_hub/models/student.dart';
import 'package:student_hub/pages/stud_info.dart';
import 'package:student_hub/pages/stud_list.dart';

void main() {
  const testStudent = Student(
    name: 'Ahmad Danial bin Rosli',
    matricNumber: 'A22EC0001',
    programme: 'Software Engineering',
    email: 'danial@graduate.utm.my',
    phone: '011-1234567',
    faculty: 'Faculty of Computing',
    year: 3,
    cgpa: 3.75,
  );

  testWidgets(
    'StudentListPage displays ListView and ListTile with student details',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: StudentListPage())),
        ),
      );

      // Verify ListView is present
      expect(find.byType(ListView), findsOneWidget);

      // Verify ListTile is present
      expect(find.byType(ListTile), findsWidgets);

      // Verify student name, matric number, and programme are shown
      expect(find.text('Ahmad Danial bin Rosli'), findsOneWidget);
      expect(find.text('A22EC0001'), findsOneWidget);
      expect(find.text('Software Engineering'), findsWidgets);

      // Verify CircleAvatar is present
      expect(find.byType(CircleAvatar), findsWidgets);

      // Tap first student to navigate
      await tester.tap(find.text('Ahmad Danial bin Rosli'));
      await tester.pumpAndSettle();

      // Verify StudentInfoPage is opened
      expect(find.byType(StudentInfoPage), findsOneWidget);
      expect(find.text('Student Details'), findsOneWidget);
    },
  );

  testWidgets(
    'StudentInfoPage displays detailed info and uses SelectableText',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: StudentInfoPage(student: testStudent)),
      );

      // Verify basic info displayed
      expect(find.text('Ahmad Danial bin Rosli'), findsOneWidget);
      expect(find.text('Student Details'), findsOneWidget);
      expect(find.text('Software Engineering'), findsWidgets);
      expect(find.text('Faculty of Computing'), findsOneWidget);
      expect(find.text('Year 3'), findsOneWidget);
      expect(find.text('3.75'), findsOneWidget);
      expect(find.text("Dean's List"), findsOneWidget);

      // Verify SelectableText is used for matric number and email
      final selectableTexts = tester.widgetList<SelectableText>(
        find.byType(SelectableText),
      );

      final selectableStrings = selectableTexts.map((w) => w.data).toList();
      expect(selectableStrings, contains('A22EC0001'));
      expect(selectableStrings, contains('danial@graduate.utm.my'));
    },
  );
}

