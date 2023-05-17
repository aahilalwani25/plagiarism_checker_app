import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'student_home_page.dart';
import 'student_profile.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/foundation.dart';

class ChangePage with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class StudentMainDashboard extends StatefulWidget {
  final String email;
  const StudentMainDashboard({super.key, required this.email});

  @override
  State<StudentMainDashboard> createState() => _StudentMainDashboardState();
}

class _StudentMainDashboardState extends State<StudentMainDashboard> {
  
  @override
  Widget build(BuildContext context) {
    print("build");
    //Content content = Provider.of<Content>(context, listen: false);
    ChangePage changePage = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                color: Colors.black,
              ),
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
                    Icon(Icons.home),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )),
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
              )),
          BottomNavigationBarItem(
              icon: const Icon(
                Icons.school,
                color: Colors.black,
              ),
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
              )),
        ],
        currentIndex: changePage.selectedIndex,
        selectedItemColor: Colors.white,
        onTap: changePage.onItemTapped,
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
        title: const AutoSizeText('Home'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.power_off))
        ],
      ),
      body: changePage.selectedIndex == 0
          ? const StudentHomePage()
          : changePage.selectedIndex == 1
              ? const Text('Chats')
              : changePage.selectedIndex == 2
                  ? const Text('Classes')
                  : StudentProfile(email: widget.email),
    );
  }
}
