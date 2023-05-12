import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Controllers/plagiarism_controller.dart';
import '../../Models/content.dart';
//import '../python/plag_agent.py';

import '../../global/components/textbox.dart';

class StudentMainDashboard extends StatefulWidget {
  String email;
  StudentMainDashboard({super.key, required this.email});

  @override
  State<StudentMainDashboard> createState() => _StudentMainDashboardState();
}

class _StudentMainDashboardState extends State<StudentMainDashboard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CustomTextBox _customTextBox = CustomTextBox();

  @override
  Widget build(BuildContext context) {
    print("build");
    //Content content = Provider.of<Content>(context, listen: false);

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Text('Student Name')],
                ),
              )
            ],
          ),
        ),
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
