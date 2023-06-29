import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:plagiarism_checker_app/Controllers/pdf_controller.dart';
import 'package:provider/provider.dart';
import '../../Controllers/plagiarism_controller.dart';
import '../../Models/content.dart';
import '../../global/components/textbox.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CustomTextBox _customTextBox = CustomTextBox();

  Widget createPlagiarisedWords(dynamic content) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          itemCount: content.length,
          itemBuilder: (itemBuilder, index) {
            return ListTile(
              title: Text(content[index].toString()),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    //Content content = Provider.of<Content>(context, listen: false);

    return Scaffold(

        // appBar: AppBar(
        //   backgroundColor: Colors.green,
        //   title: const AutoSizeText('Home'),
        //   actions: [
        //     IconButton(onPressed: (){}, icon: const Icon(Icons.settings)),
        //     IconButton(onPressed: (){}, icon: const Icon(Icons.power_off))
        //   ],
        // ),
        body: Consumer<Content>(builder: (builder, content, child) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            const Center(
                child: AutoSizeText(
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
                        final plag = await pc.start_check();
                        content.setPlagiarised(plag);
                        content.setWordsCount(
                            content.plagiarised!['values'].length);
                        content.setEnabled(true);
                      }
                    },
                    backgroundColor:
                        content.enabled ? Colors.green : Colors.green[300],
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

            Divider(),
            content.content == null
                ? (const Text("Paste the content you want to plagiarise"))
                : content.enabled == false
                    ? const Text("Please wait for detecting plagiarism")
                    : content.plagiarised != null
                        ? SizedBox(
                            child: ActionChip(
                              padding: const EdgeInsets.all(8),
                              backgroundColor: Color(0xFFF44336),
                              onPressed: ()async{
                                PdfController pdfController= PdfController(content: content);
                                await pdfController.openFile();
                              },
                                label: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Download Report"),
                                    Icon(Icons.download, )
                                  ],
                                )),
                          )
                        : const Text("No Plagiarism"),
          ],
        ),
      );
    }));
  }

  Widget getList(Content content) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(content.plagiarised!['url']),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
                itemCount: content.plagiarised!['values'].length,
                itemBuilder: (itemBuilder, index) {
                  return ListTile(
                    shape: Border.all(style: BorderStyle.solid),
                    style: ListTileStyle.list,
                    tileColor: Colors.blue,
                    title: AutoSizeText(
                        content.plagiarised!['values'][index].toString()),
                    //subtitle: AutoSizeText(content.plagiarised!['values'][index].toString()),
                  );
                }),
          )
        ],
      ),
    );
  }
}
