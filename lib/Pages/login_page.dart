// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wallpapperapp/utilities/routes.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  movetohome(BuildContext context) async {
    //made a method for the stateful wala part
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      // ignore: use_build_context_synchronously

      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          // this is is used that even in small screens we can scroll from top to bottom.
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "asset/images/login.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height:
                    20, //can be used to increase the space between two things.
              ),
              Text(
                "Welcome $name ",
                style: const TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 104, 2, 122),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal:
                        15.0), // here to make the placing equal the two textformfields are written in a column and the padding is use
                child: Form(
                  key: _formkey, //Assosiates a key to buth the text fields
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username :",
                          labelText: "Username",
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Username cannot be empty.";
                          }
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {
                            // only applicable in stateful widgets
                          });
                        },
                      ),
                      TextFormField(
                        obscureText:
                            true, //this will take the password in dot wala format.
                        decoration: const InputDecoration(
                            hintText: "Enter Password :",
                            labelText: "Password"),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Password cannot be empty.";
                          } else if (val.length < 6) {
                            return "Password cannot be less than 8 characters";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Material(
                        color: Color.fromARGB(255, 72, 2, 84),
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 30),
                        child: InkWell(
                          //ussed to make that onpress wala feature
                          splashColor: Color.fromARGB(255, 245, 109, 155),
                          onTap: () async => movetohome(context),
                          child: AnimatedContainer(
                            // container isn't clickable.
                            duration: const Duration(seconds: 1),
                            width: changeButton
                                ? 50
                                : 150, // here if changebutton is true then width will be 50 otherwise it'll be 150.
                            height: 50,
                            alignment: Alignment.center,
                            // shape: changeButton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,

                            //Either use this or BorderRadius wala
                            child: changeButton
                                ? const Icon(Icons.done, color: Colors.white)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                          ),
                        ),
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      //   child: Text("Login"),
                      //   style: TextButton.styleFrom(
                      //     minimumSize: Size(100, 40),
                      //     foregroundColor: Color.fromARGB(255, 248, 248, 248),
                      //     backgroundColor: Color.fromARGB(255, 125, 3, 141),
                      //   ),
                      // ), // can make a button using this
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
