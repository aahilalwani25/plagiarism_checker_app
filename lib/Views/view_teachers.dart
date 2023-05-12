import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:plagiarism_checker_app/global/components/Screen.dart';
import 'package:provider/provider.dart';

import 'filter_screen.dart';

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
    TextEditingController search = TextEditingController();
    Screen screen = Screen(context: context);

    print('object');

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
            title: const Text('Manage Teachers'),
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const FilterScreen()));
                  },
                  icon: const Icon(Icons.filter_list_rounded))
            ]),
        body: Consumer(
          builder: (context, value, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: search,
                    keyboardType: TextInputType.name,
                    onSaved: (teacher) {
                      //loginModel.setEmail(email!);
                    },
                    validator: (teacher) =>
                        teacher!.isEmpty ? "Text required" : null,
                    decoration: const InputDecoration(
                        //prefixIcon: const Icon(Icons.search),
                        hintText: "Search...",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),

                //display teachers data
                Expanded(
                    child: FirebaseAnimatedList(
                        query: FirebaseDatabase.instance.ref('teachers'),
                        itemBuilder: (context, snapshot, animation, index) {
                          if (snapshot.exists) {
                            String value =
                                snapshot.child('full_name').value.toString();
                            if (value.toLowerCase().contains(search.text)) {
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text(
                                    value[0].toUpperCase(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(value),
                                trailing: SizedBox(
                                  width: screen.width! * 0.33,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          child: const CircleAvatar(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.green,
                                            child: Icon(Icons.edit),
                                          ),
                                        ),
                                        GestureDetector(
                                          child: const CircleAvatar(
                                              child: Icon(
                                                  Icons.remove_red_eye_sharp)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            getAlert(context, value, snapshot);
                                          },
                                          child: const CircleAvatar(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.red,
                                            child: Icon(Icons.delete),
                                          ),
                                        ),
                                      ]),
                                ),
                              );
                            }
                          }
                          return const Center(
                            child: Text("No Teachers Data"),
                          );
                        }))
              ],
            );
          },
        ));
  }

  void getAlert(BuildContext context, String user, DataSnapshot snapshot) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            content: Text("Are you sure you want to delete $user?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    FirebaseDatabase.instance
                        .ref('teachers')
                        .child(snapshot.key.toString())
                        .remove();
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.check))
            ],
          );
        });
  }
}
