import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controllers/plagiarism_controller.dart';
import '../Models/content.dart';
//import '../python/plag_agent.py';

import '../global/components/textbox.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  GlobalKey<FormState> _form_key = GlobalKey<FormState>();
  CustomTextBox _customTextBox = CustomTextBox();

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
            key: _form_key,
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
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_form_key.currentState!.validate()) {
                            
                            PlagiarismController pc =
                                PlagiarismController(text: content.content!);
                            print(await pc.start_check());
                            
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                               Colors.green,
                        ),
                        child: const Center(
                            child: Text(
                          "Submit",
                        ))),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
