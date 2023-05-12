import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:plagiarism_checker_app/Views/login_screen.dart';

import '../global/components/Screen.dart';
import 'sign_up_screen.dart';

class AppStartScreen extends StatefulWidget {
  const AppStartScreen({super.key});

  @override
  State<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Screen screen = Screen(context: context);
    return Scaffold(
        backgroundColor: Colors.green,
        bottomSheet: SizedBox(
          height: screen.height! * 0.4,
          child: Column(
            children: [
              const Center(
                child: AutoSizeText(
                  "Welcome to Plagiarism Checker",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                width: screen.width!*0.8,
                height: screen.height!*0.1,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>LoginScreen(user: 'students',)));
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: const AutoSizeText(
                    "Login as Student",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AutoSizeText(
                    "New Student? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>SignupScreen(user: 'students',)));
                    },
                    child: const AutoSizeText(
                      "Signup",
                      style: TextStyle(fontSize: 15, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                width: screen.width! * 0.8,
                height: screen.height! * 0.1,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>LoginScreen(user: 'teachers',)));
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: const AutoSizeText(
                    "Login as Teacher",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AutoSizeText(
                    "New Teacher? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>SignupScreen(user: 'teachers',)));
                    },
                    child: const AutoSizeText(
                      "Signup",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
