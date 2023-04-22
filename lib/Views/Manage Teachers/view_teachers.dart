import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../filter_screen.dart';

class ViewTeachers extends StatefulWidget {
  const ViewTeachers({super.key});

  @override
  State<ViewTeachers> createState() => _ViewTeachersState();
}

class _ViewTeachersState extends State<ViewTeachers> {
  bool en = false;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
          title: Text('Manage Teachers'),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>const FilterScreen()));
                }, icon: const Icon(Icons.filter_list_rounded))
          ]),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                onSaved: (teacher) {
                  //loginModel.setEmail(email!);
                },
                validator: (teacher) =>
                    teacher!.isEmpty ? "Text required" : null,
                decoration: InputDecoration(
                    //prefixIcon: const Icon(Icons.search),
                    hintText: "Search...",
                    suffixIcon: IconButton(
                        splashRadius: 20,
                        iconSize: 20,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        icon: const Icon(Icons.search)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            ),

            //display table
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(
                      color: Colors.black,
                      
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  children: [
                    //header
                    TableRow(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                        ),
                        children: const [
                          SizedBox(
                              height: 30,
                              width: 20,
                              child: Center(
                                  child: Text(
                                'ID',
                                style: TextStyle(color: Colors.white),
                              ))),
                          SizedBox(
                              height: 30,
                              width: 20,
                              child: Center(
                                  child: Text(
                                'Name',
                                style: TextStyle(color: Colors.white),
                              ))),
                          SizedBox(
                              height: 30,
                              child: Center(
                                  child: Text(
                                'Actions',
                                style: TextStyle(color: Colors.white),
                              )))
                        ]),

                    //teacher data
                    TableRow(children: [
                      SizedBox(height: 30, child: Center(child: Text('01'))),
                      SizedBox(height: 30, child: Center(child: Text('Aahil Alwani'))),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                            height: 50,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        //maximumSize: Size(10, 40)
                                      ),
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.remove_red_eye_rounded,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {},
                                      child: Icon(Icons.delete),
                                    ),
                                  )
                                ],
                              ),
                            ))),
                      )
                    ])
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
