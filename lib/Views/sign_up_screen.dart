import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plagiarism_checker_app/Controllers/signup_controller.dart';
import 'package:plagiarism_checker_app/Models/new_student.dart';
import 'package:plagiarism_checker_app/global/components/toast_message.dart';
import 'package:provider/provider.dart';
import '../Controllers/auth_controller.dart';
//import '../Controllers/countries_controller.dart';
import '../Models/content.dart';
import '../Models/countries.dart';
import '../global/components/Screen.dart';
import 'login_screen.dart';


class SignupScreen extends StatefulWidget {
  final String user;
  const SignupScreen({super.key, required this.user});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String country_code = "+92";
  Screen? screen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.user == "students") {
      return studentSignup();
    }
    return teacherSignup();
  }

  Countries countries = Countries();
  Widget studentSignup() {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    
    //CountriesController countriesController = CountriesController();

    Content content = Content();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<NewStudent>(
            builder: (builder, newStudent, child) {
              return Form(
                key: formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(18),
                        child: AutoSizeText(
                          'SIGN UP AS STUDENT',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          onChanged: (email) {
                            newStudent.setUsername(email);
                          },
                          validator: (email) =>
                              email!.isEmpty ? "Please enter Username" : null,
                          decoration: const InputDecoration(
                              labelText: "Username *",
                              prefixIcon: Icon(Icons.person),
                              hintText: "Enter your Username *",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (email) {
                            newStudent.setEmail(email);
                          },
                          validator: (email) =>
                              email!.isEmpty ? "Please enter Email" : null,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: "Email *",
                              hintText: "Enter your Email *",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: CountryCodePicker(
                              onChanged: (code) {
                                newStudent.setCountryCode(countries);
                                newStudent.setCountry(countries);
                              },
                              initialSelection: 'pk',
                            ),
                          ),
                          SizedBox(
                            width: 262,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              onChanged: (phone) {
                                newStudent.setPhone(
                                    '${newStudent.country_code ?? countries}$phone');
                              },
                              validator: (email) => email!.isEmpty
                                  ? "Please enter Phone Number"
                                  : null,
                              decoration: InputDecoration(
                                  prefixText: newStudent.country_code ??
                                      countries.countryCode,
                                  labelText: "Phone Number *",
                                  prefixIcon: const Icon(Icons.phone),
                                  hintText: "Enter your Phone Number *",
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  )),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: TextFormField(
                            obscureText: newStudent.password_visible,
                            onChanged: (password) {
                              newStudent.setPassword(password);
                            },
                            validator: (password) => password!.isEmpty
                                ? "Please enter Password"
                                : null,
                            decoration: InputDecoration(
                                labelText: "Password *",
                                prefixIcon: const Icon(Icons.password),
                                hintText: "Enter your Password *",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    newStudent.setPasswordVisible(
                                        !newStudent.password_visible);
                                  },
                                  child: !newStudent.password_visible
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 5, style: BorderStyle.solid)))),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: TextFormField(
                            obscureText: newStudent.c_password_invisible,
                            validator: (password) => password!.isEmpty
                                ? "Please enter Password"
                                : newStudent.password != password
                                    ? "Password and confirm Password does not match"
                                    : null,
                            decoration: InputDecoration(
                                labelText: "Confirm Password *",
                                prefixIcon: const Icon(Icons.password),
                                hintText: "Enter your Confirm Password *",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    newStudent.setConfirmPasswordVisible(
                                        !newStudent.c_password_invisible);
                                  },
                                  child: !newStudent.password_visible
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        padding: const EdgeInsets.all(16),
                        child: AbsorbPointer(
                          absorbing: content.enabled ? false : true,
                          child: ActionChip(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                SignupController signupController =
                                    SignupController(context: context);
                                signupController
                                    .signup(
                                        newStudent.email!,
                                        newStudent.phone!,
                                        newStudent.username!,
                                        newStudent.country ??
                                            countries.countryName,
                                        newStudent.password!)
                                    .then((value) {
                                  if (value) {
                                    ToastMessage(
                                            context: context,
                                            message: "Successsfully signed up",
                                            type: "success")
                                        .show();
                                    //goto login
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => const LoginScreen(
                                                  user: 'students',
                                                )));
                                  }
                                });
                              }
                              
                            },
                            backgroundColor: content.enabled
                                ? Colors.green
                                : Colors.green[300],
                            label: Center(
                                child: content.enabled
                                    ? const Text(
                                        "SIGN UP",
                                      )
                                    : const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      )),
                          ),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: AutoSizeText('Or Continue With'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              try {
                                UserCredential credentials =
                                    await AuthController.signupWithGoogle();

                                // ignore: unnecessary_null_comparison
                                if (credentials.credential!.providerId !=
                                    null) {
                                  // ignore: use_build_context_synchronously
                                  ToastMessage(
                                      context: context,
                                      message: "Signed up Successfully",
                                      type: "success");

                                  //goto login
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => const LoginScreen(
                                                user: 'students',
                                              )));
                                } else {
                                  // ignore: use_build_context_synchronously
                                  ToastMessage(
                                      context: context,
                                      message: "Signed up failed",
                                      type: "error");
                                }
                              } on Exception catch (e) {
                                ToastMessage(
                                    context: context,
                                    message: "Signed up failed: $e",
                                    type: "error");
                              }
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 194, 194, 194)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Image.asset(
                                'assets/images/google_logo.png',
                              ), //google logo
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 194, 194, 194)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget teacherSignup() {
    return const Scaffold();
  }
}
