import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  final String email;
  const TeacherDashboard({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: MainTeacherHomePage(),
    );
  }
}

class MainTeacherHomePage extends StatefulWidget {
  const MainTeacherHomePage({super.key});

  @override
  State<MainTeacherHomePage> createState() => _MainTeacherHomePageState();
}

class _MainTeacherHomePageState extends State<MainTeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}