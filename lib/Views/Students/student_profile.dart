import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../global/components/Screen.dart';

class StudentProfile extends StatefulWidget {
  final String email;
  const StudentProfile({super.key, required this.email});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    Screen screen = Screen(context: context);
    return Scaffold(
        body: Column(
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(children: [
                  CircleAvatar(
                      radius: screen.width!*0.15,
                      backgroundImage:
                          const AssetImage("assets/images/no_image_person.jpg")),

                  Positioned(
                      bottom: 0,
                      left: 50,
                      child: RawMaterialButton(
                        onPressed: (){

                        },
                        elevation: 2.0,
                        fillColor: const Color(0xFFF5F6F9),
                        //padding: EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.blue,
                        ),
                      )),
                ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    '@Username',
                    style: TextStyle(fontSize: 30),
                  ),
                  AutoSizeText(widget.email),
                ],
              )
            ],
          ),
        ),

        const Card(
          borderOnForeground: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //heading of biography
              AutoSizeText('Personal Information', style: TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),),
              AutoSizeText(''),
            ],
          ),
        )
      ],
    ));
  }
}
