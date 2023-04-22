import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../Controllers/login_controller.dart';
import '../Database/database.dart';
import '../Models/login_model.dart';
import '../global/components/Screen.dart';
import 'admin_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //bool is_loading = false;
    Screen screen = Screen(context: context);
    final formKey = GlobalKey<FormState>();
    bool remember_me = false;
    RoundedLoadingButtonController roundedLoadingButtonController =
        RoundedLoadingButtonController();

    print('build');
    return Scaffold(
        body: Consumer<LoginModel>(builder: (builder, loginModel, child) {
      return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (email) {
                    loginModel.setEmail(email);
                  },
                  validator: (email) =>
                      email!.isEmpty ? "Please enter Email" : null,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                    obscureText: true,
                    onChanged: (password) {
                      loginModel.setPassword(password);
                    },
                    validator: (password) =>
                        password!.isEmpty ? "Please enter Password" : null,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        hintText: "Enter your Password",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: loginModel.remember_me,
                        onChanged: ((value) {
                          loginModel.changeRememberMe(value!);
                        }),
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                        focusColor: Colors.green,
                      ),
                      const Text('Remember Me'),
                    ],
                  ),
                  GestureDetector(
                    child: const Text('Forgot Password'),
                  )
                ],
              ),
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
                    // style: ElevatedButton.styleFrom(
                    //   backgroundColor: Colors.green,
                    //   fixedSize: const Size.fromWidth(300),
                    //   //minimumSize: Size.fromWidth(200),
                    // ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        LoginController loginController = LoginController();

                        loginController
                            .getLogin(loginModel.email, loginModel.password)
                            .then((value) {
                          if (value) {
                            roundedLoadingButtonController.success();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => AdminDashboard(
                                          email: loginModel.email,
                                        )));
                          }else{
                            
                          }
                        });
                      }
                      Future.delayed(Duration(seconds: 2), () {
                        roundedLoadingButtonController.reset();
                      });
                    },
                    child: const Text('LOGIN')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New to the Application? '),
                  GestureDetector(onTap: () {}, child: const Text('Sign up')),
                ],
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
          ));
    }));
  }
}
