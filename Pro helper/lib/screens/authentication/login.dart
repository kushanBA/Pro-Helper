import 'package:flutter/material.dart';
import 'package:pro/constans/colors.dart';
import 'package:pro/constans/styles.dart';
import 'package:pro/screens/authentication/register.dart';
import 'package:pro/services/auth.dart';

class LogIn extends StatefulWidget {
  final Function toggle;
  const LogIn({Key? key, required this.toggle}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  //reference for button anon
  final AuthServices _auth = AuthServices();
  //form key
  final _formKey = GlobalKey<FormState>();
  //emai and password
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgBackground,
          appBar: AppBar(
            backgroundColor: bgAppBar,
            title: const Text("Seller Log in"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 8.0, left: 8.0, bottom: 8, top: 2),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/vecteezy_working-man-and-wrench-icon-isolated-on-white-background_5388265.png",
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Text(
                    "Pro Helper",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromARGB(255, 46, 7, 103),
                        fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            //Email
                            TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  labelText: "Email",
                                  hintText: "",
                                  hintStyle: TextStyle(
                                      color: bgblack.withOpacity(0.5))),
                              validator: (val) => val?.isEmpty == true
                                  ? "Enter a valid Email"
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //password
                            TextFormField(
                              obscureText: true,
                              decoration: textInputDecoration.copyWith(
                                  labelText: "Password",
                                  hintText: "",
                                  hintStyle: TextStyle(
                                      color: bgblack.withOpacity(0.5))),
                              validator: (val) => val!.length < 6
                                  ? "Enter a valid Password"
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  password = val;
                                });
                              },
                            ),
                            //google
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              error,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Login with Google",
                                style: discriptionStyle),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              //sign in with google
                              onTap: () {},
                              child: Center(
                                child: Image.asset(
                                  "assets/pngwing.com (2).png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Do not have an account?",
                                  style: discriptionStyle,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  //go to the Registerpage
                                  onTap: () {
                                    widget.toggle();
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                        color: bgblue,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            //button
                            GestureDetector(
                              //method for login user
                              onTap: () async {
                                dynamic result =
                                    await _auth.signInUsingEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = "Cannot find the user credentials";
                                  });
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: bgyellow,
                                    borderRadius: BorderRadius.circular(100),
                                    border:
                                        Border.all(width: 2, color: bgblack)),
                                child: const Center(
                                    child: Text("LOG IN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500))),
                              ),
                            ),
                            //anon
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () async {
                                // ignore: avoid_print
                                dynamic results = await _auth.singInAnonymous();
                                if (results == null) {
                                  print("Found error in Sign in");
                                } else {
                                  print("Sign In");
                                  print(results.uid);
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: bgyellow,
                                    borderRadius: BorderRadius.circular(100),
                                    border:
                                        Border.all(width: 2, color: bgblack)),
                                child: const Center(
                                    child: Text("Log in as user ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500))),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
