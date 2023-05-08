import 'package:flutter/material.dart';
import 'package:plagiarism_checker_app/Models/content.dart';
import 'package:provider/provider.dart';
import 'Models/login_model.dart';
import 'Models/new_student.dart';
import 'Models/onboard_contents.dart';
import 'Views/app_start_screen.dart';
import 'Views/onboard_screen.dart';
import 'Views/user_main_dashboard.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewStudent>(create: (_) => NewStudent()),
        ChangeNotifierProvider<Content>(create: (_)=>Content()),
        ChangeNotifierProvider<LoginModel>(create: (_)=>LoginModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        darkTheme: ThemeData.light(),
        //themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColorDark: Colors.green,
          primaryColor: Colors.green,
          primarySwatch: Colors.blue,
        ),
        home: AppStartScreen(),
      ),
    );
  }
}

