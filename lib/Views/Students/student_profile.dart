import 'package:flutter/material.dart';

class StudentProfile extends StatefulWidget {
  final String email;
  const StudentProfile({super.key, required this.email});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body:Column(
        children: [

        ],
      )
    );
  }
}