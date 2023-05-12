import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Controllers/plagiarism_controller.dart';
import '../../Models/content.dart';
//import '../python/plag_agent.py';

import '../../global/components/textbox.dart';

class StudentMainDashboard extends StatefulWidget {
  final String email;
  StudentMainDashboard({super.key, required this.email});

  @override
  State<StudentMainDashboard> createState() => _StudentMainDashboardState();
}

class _StudentMainDashboardState extends State<StudentMainDashboard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CustomTextBox _customTextBox = CustomTextBox();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    //Content content = Provider.of<Content>(context, listen: false);

    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home, color: Colors.black,),
              label: '',
              activeIcon: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home),
                    Text('Home', style: TextStyle(color: Colors.white),)
                  ],
                ),
              )
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat_sharp, color: Colors.black),
              label: '',
              activeIcon: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.chat_sharp),
                      Text(
                        'Chats',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.school, color: Colors.black,),
                label: '',
                activeIcon: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.school),
                      Text(
                        'Classes',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person, color: Colors.black),
              label: '',
              activeIcon: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person),
                      Text(
                        'Profile',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          
          onTap: _onItemTapped,
        ),
        // drawer: Drawer(
        //   child: Column(
        //     children: [
        //       DrawerHeader(
        //         decoration: const BoxDecoration(
        //           color: Colors.green,
        //         ),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: const [Text('Student Name')],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        body: Consumer<Content>(builder: (builder, content, child) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                    child: Text(
                  "Check Plagiarised Content",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )),
                SizedBox(
                  
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: TextFormField(
                    enabled: content.enabled,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Please enter the content";
                      }
                      return null;
                    },
                    initialValue: null,
                    onChanged: (text) {
                      //save text
                      content.setContent(text);
                    },
                    maxLines: 20,
                    maxLength: 200,
                    decoration: _customTextBox.large_size(
                        "Paste Text Here", Colors.grey[350]!, null),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: AbsorbPointer(
                      absorbing: content.enabled ? false : true,
                      child: ActionChip(
                        
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            content.setEnabled(false);
                            PlagiarismController pc =
                                PlagiarismController(text: content.content!);
                            content.setPlagiarised(await pc.start_check());
                            content.setEnabled(true);
                          }
                        },
                        backgroundColor: content.enabled ? Colors.green : Colors.green[300],
                        label: Center(
                            child: content.enabled
                                ? const Text(
                                    "Submit",
                                  )
                                : const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  )),
                      ),
                    ),
                  ),
                ),
                content.plagiarised!=null? Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: Text(content.plagiarised!.toString()),
                ):const Text("No Plagiarism"),
              ],
            ),
          );
        }));
  }
}
