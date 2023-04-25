import 'package:flutter/material.dart';
import '../global/components/Screen.dart';
import 'view_teachers.dart';

// Widget Teacher_List(){
//   return Column(
//     children: [
//       ListTile(
//         onTap: () {},
//         leading: Icon(Icons.attach_money),
//         title: const Text('Register Teacher'),
//       ),
//       ListTile(
//         onTap: () {},
//         leading: Icon(Icons.receipt),
//         title: const Text('Update Teacher Record'),
//       ),
//       ListTile(
//         onTap: () {},
//         leading: Icon(Icons.table_chart),
//         title: const Text('Remove a Teacher'),
//       ),
//       ListTile(
//         onTap: () {},
//         leading: Icon(Icons.map_rounded),
//         title: const Text('Generate Teacher Report'),
//       ),
//     ],
//   );
// }


Widget AdminDrawer(BuildContext context, Screen screen, String email) {

  bool teacher_list_dropdown= false;
  print('object');
  return Drawer(
    child: Column(
      children: [
        DrawerHeader(
            child: Container(
          width: screen.width,
          height: screen.height! * 0.5,
          child: Text(email),
        )),
        //Drawer Lists
        ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>const ViewTeachers()));
          },
          //trailing: teacher_list_dropdown==true?const Icon(Icons.arrow_drop_up):const Icon(Icons.arrow_drop_down),
          leading: const Icon(Icons.manage_accounts),
          title: const Text('Manage Teacher'),
        ),
        //teacher_list_dropdown==true?Teacher_List():const Padding(padding: EdgeInsets.all(0.1)),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.attach_money),
          title: const Text('Manage Subscription'),
        ),

        ListTile(
          onTap: (){},
          leading: Icon(Icons.receipt),
          title: const Text('Manage Reports'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.table_chart),
          title: const Text('Manage Database'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.map_rounded),
          title: const Text('Countries Visibility'),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.chat_rounded),
          title: const Text('Chats'),
        ),
      ],
    ),
  );
}
