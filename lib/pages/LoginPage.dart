import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
          color: context.canvasColor,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/login_img.png",
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Welcome $name",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter username",
                              labelText: "Username"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            name = value;
                            setState(
                                () {}); // Call the build method again for change the state of the screen
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Enter email", labelText: "Email"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Enter password",
                              labelText: "Password"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value.length < 6) {
                              return "Password length should be least 6";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Material(
                          color: context.theme.buttonColor,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButton ? 60 : 100,
                              height: 50,
                              alignment: Alignment.center,
                              child: changeButton
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Haven't any account? click here for Register",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
