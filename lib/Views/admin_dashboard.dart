import 'package:flutter/material.dart';
import 'package:plagiarism_checker_app/global/components/Screen.dart';

import 'admin_drawer.dart';

class AdminDashboard extends StatefulWidget {
  final String email;
  const AdminDashboard({super.key, required this.email});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {

    Screen screen= Screen(context: context);
    return Scaffold(
      appBar: AppBar(),
      drawer: AdminDrawer(context, screen, widget.email),
      body: const Column(

      ),
    );
  }
}