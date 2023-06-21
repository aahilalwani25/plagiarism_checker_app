import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../global/components/Screen.dart';

class StudentProfile extends StatefulWidget {
  final String email, username;
  //final String username;
  const StudentProfile({super.key, required this.email, required this.username});

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
                          //for photo
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
                  AutoSizeText(widget.username,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              //heading of biography
              AutoSizeText('Settings', style: TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),),
              ListTile(
                leading: Icon(Icons.privacy_tip_rounded),
                title: AutoSizeText('Privacy'),
                trailing: Icon(Icons.arrow_right),
              ),

              ListTile(
                leading: Icon(Icons.history_edu),
                title: AutoSizeText('Plagiarism History'),
                trailing: Icon(Icons.arrow_right),
              ),

              ListTile(
                leading: Icon(Icons.list_alt_sharp),
                title: AutoSizeText('Reports'),
                trailing: Icon(Icons.arrow_right),
              ),

              ListTile(
                leading: Icon(Icons.workspace_premium),
                title: AutoSizeText('Setup Premium Account'),
                trailing: Icon(Icons.arrow_right),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
