import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controllers/login_controller.dart';
import '../Models/content.dart';
import '../Models/login_model.dart';


class LoginScreen extends StatefulWidget {
  final String user;
  const LoginScreen({super.key, required this.user});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //bool is_loading = false;
    //Screen screen = Screen(context: context);
    //Styles styles= Styles(context: context);
    final formKey = GlobalKey<FormState>();
    //bool rememberMe = false;

    Content content= Content();

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
                child: AutoSizeText(
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
                    obscureText: !loginModel.password_visible,
                    onChanged: (password) {
                      loginModel.setPassword(password);
                    },
                    validator: (password) =>
                        password!.isEmpty ? "Please enter Password" : null,
                    decoration: InputDecoration(
                        labelText: "Password *",
                        prefixIcon: const Icon(Icons.password),
                        hintText: "Enter your Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            loginModel.setPasswordVisible(!loginModel.password_visible);
                          },
                          child: !loginModel.password_visible? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
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
                      const AutoSizeText('Remember Me'),
                    ],
                  ),
                  GestureDetector(
                    child: const AutoSizeText('Forgot Password'),
                  )
                ],
              ),
              Container(
                // width: 300,
                height: 80,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                padding: const EdgeInsets.all(16),
                child: AbsorbPointer(
                  absorbing: content.enabled ? false : true,
                  child: ActionChip(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        LoginController loginController = LoginController(
                            context: context,
                            email: loginModel.email,
                            password: loginModel.password,
                            user: widget.user);

                        loginController.getLogin();
                      }
                      
                    },
                    backgroundColor:
                        content.enabled ? Colors.green : Colors.green[300],
                    label: Center(
                        child: content.enabled
                            ? const Text(
                                "Login",
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
                        borderRadius: const BorderRadius.all(Radius.circular(20))),
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
