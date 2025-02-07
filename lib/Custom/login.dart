// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:login_project/Custom/home_page.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController getUserEmail = TextEditingController();
  TextEditingController getUserPass = TextEditingController();
  FocusNode emailLabelFocus = FocusNode();
  FocusNode passwordLabelFocus = FocusNode();
  Color _labelColorEmail = Colors.grey;
  Color _labelColorPasword = Colors.grey;
  bool passToggle = true;
  final _formKey = GlobalKey<FormState>();

  // String? _validateEmail({required String email}) {
  //   if (email.isEmpty) {
  //     return "empty ";
  //   } else if (email.contains("@")) {
  //     return "";
  //   }
  //   return "please enter valid email";
  // }

  // ignore: unused_element
  // String? _validatePassword({required String pass}) {}

  @override
  void initState() {
    super.initState();
    emailLabelFocus.addListener(() {
      setState(() {
        // Change the border color based on focus state
        _labelColorEmail =
            emailLabelFocus.hasFocus ? Colors.amber : Colors.grey;
      });
    });
    passwordLabelFocus.addListener(() {
      setState(() {
        // Change the border color based on focus state
        _labelColorPasword =
            passwordLabelFocus.hasFocus ? Colors.amber : Colors.grey;
      });
    });
  }

  @override
  void dispose() {
    emailLabelFocus.dispose();
    passwordLabelFocus.dispose();

    // Dispose the focus node
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login "),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: getUserEmail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "empty email";
                      }
                      if (!value.contains("@")) {
                        return "please enter proper email";
                      }
                      return "";
                    },
                    focusNode: emailLabelFocus,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 20,
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(color: _labelColorEmail),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.amber, width: 2.0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        fillColor: Colors.amber,
                        focusColor: Colors.amberAccent,
                        floatingLabelAlignment: FloatingLabelAlignment.start),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: getUserPass,
                      //password
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "empty password ";
                        }
                        return "";
                      },
                      focusNode: passwordLabelFocus,
                      obscureText: passToggle,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline_sharp,
                            size: 20,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: _labelColorPasword),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.amber, width: 2.0),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          fillColor: Colors.amber,
                          focusColor: Colors.amberAccent,
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(passToggle
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ))),
                  SizedBox(height: 30),

                  ElevatedButton(
                      onPressed: () {
                        print(getUserPass.text);
                        print(getUserEmail.text);

                        if (_formKey.currentState!.validate()) {}
                        if (getUserEmail.text == "hammad@" &&
                            getUserPass.text == "123") {
                          // print(userPass);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('wrong user '),
                              backgroundColor: Colors.red,
                            ),
                          );

                          setState(() {});
                        }
                      },
                      child: const Text('Submit'))

                  // MyButtonLogin(_formKey.currentState!.validate())
                ],
              ),
            )),
      ),
    );
  }
}
