import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:plagiarism_checker_app/Models/new_student.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../global/components/Screen.dart';

class SignupScreen extends StatefulWidget {
  String user;
  SignupScreen({super.key, required this.user});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  String country_code= "+92";
  Screen? screen;

  @override
  Widget build(BuildContext context) {
    screen= Screen(context: context);
    if (widget.user == "students") {
      return studentSignup();
    }
    return teacherSignup();
  }

  Widget studentSignup() {
    GlobalKey<FormState> form_key= GlobalKey<FormState>();
    RoundedLoadingButtonController roundedLoadingButtonController= RoundedLoadingButtonController();

    return Scaffold(
      body: Consumer<NewStudent>(
        builder: (builder, new_student, child) {
          return Form(
            key: form_key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'SIGN UP AS STUDENT',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    onChanged: (email) {
                      new_student.setEmail(email);
                    },
                    validator: (email) =>
                        email!.isEmpty ? "Please enter Full Name" : null,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter your Full Name *",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {
                      new_student.setEmail(email);
                    },
                    validator: (email) =>
                        email!.isEmpty ? "Please enter Email" : null,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter your Email *",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                  ),
                ),
          
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric( horizontal: 16.0),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey, ), borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: CountryCodePicker(
                        
                        onChanged: (code){
                          new_student.setCountryCode(code.dialCode!);
                          new_student.setCountry(code.name);
                        },
                        initialSelection: 'pk',
                      ),
                    ),
      
                    SizedBox(
                      width: 262,
                      child: TextFormField(
                      keyboardType: TextInputType.phone,
                      onChanged: (email) {
                      new_student.setEmail(email);
                      },
                      validator: (email) =>
                        email!.isEmpty ? "Please enter Phone Number" : null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Enter your Phone Number *",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                                      ),
                    ),
                    
                  ],
                ),
          
          
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                      obscureText: true,
                      onChanged: (password) {
                        new_student.setPassword(password);
                      },
                      validator: (password) =>
                          password!.isEmpty ? "Please enter Password" : null,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          hintText: "Enter your Password *",
                          suffixIcon: GestureDetector(
                            child: const Icon(Icons.remove_red_eye_sharp),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 5,
                                  style: BorderStyle.solid)))),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                      obscureText: true,
                      
                      validator: (password) =>
                          password!.isEmpty ? "Please enter Password" : null,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          hintText: "Enter your Confirm Password *",
                          suffixIcon: GestureDetector(
                            child: const Icon(Icons.remove_red_eye_sharp),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 5,
                                  style: BorderStyle.solid)))),
                ),
                //sign up button
                Container(
                  // width: 300,
                  height: 80,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  padding: const EdgeInsets.all(16),
                  child: RoundedLoadingButton(
                      color: Colors.green,
                      controller: roundedLoadingButtonController,
                      errorColor: Colors.red,
                      successColor: Colors.green,
                      onPressed: () {
                        if (form_key.currentState!.validate()) {
                          // LoginController loginController = LoginController();
          
                          // loginController.getLogin(context, loginModel.email,
                          //     loginModel.password, widget.user);
                        }
                        Future.delayed(const Duration(seconds: 2), () {
                          roundedLoadingButtonController.reset();
                        });
                      },
                      child: const Text('SIGN UP', style: TextStyle(fontSize: 20),)),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text('Or Continue With'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 194, 194, 194)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Image.asset(
                        'assets/images/google_logo.png',
                      ), //google logo
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 194, 194, 194)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Image.asset(
                        'assets/images/facebook_logo.png',
                        cacheWidth: 50,
                        cacheHeight: 50,
                      ), //google logo
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget teacherSignup() {
    return Scaffold();
  }
}
