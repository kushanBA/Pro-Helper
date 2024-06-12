import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/constans/colors.dart';
import 'package:pro/constans/styles.dart';
import 'package:pro/screens/authentication/login.dart';
import 'package:pro/services/auth.dart';
import 'package:pro/services/userss.dart';

// ...

class Register extends StatefulWidget {
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final UserManagement userManagement = UserManagement();
  final FirebaseAuth _auth1 = FirebaseAuth.instance;
  final _NameController = TextEditingController();
  final _EmailController = TextEditingController();
  final _QualificationsController = TextEditingController();
  final _SkillsController = TextEditingController();

  String dropdownValue = "One";

  @override
  void dispose() {
    _NameController.dispose();
    _EmailController.dispose();
    _QualificationsController.dispose();
    _SkillsController.dispose();
    super.dispose();
  }

  Future addUserDetails(
    String uid,
    String namee,
    String email,
    String qualificationss,
    String skillss,
  ) async {
    FirebaseFirestore.instance.collection('Doctor').add({
      'uid': uid,
      'name': namee,
      'email': email,
      'qualifications': qualificationss,
      'skills': skillss,
    });
  }

  @override
  final AuthServices _auth = AuthServices();

  //form key
  final _formKey = GlobalKey<FormState>();
  //emai and password
  String userIdd = "";
  String userId = "";
  String email = "";
  String password = "";
  String namee = "";
  String error = "";
  String qualificationss = "";
  String skillss = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bgBackground,
          appBar: AppBar(
            backgroundColor: bgAppBar,
            title: const Text("Register as Seller"),
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
                    padding: const EdgeInsets.all(12),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            //Email
                            TextFormField(
                              controller: _EmailController,
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
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _NameController,
                              decoration: textInputDecoration.copyWith(
                                  labelText: "Name",
                                  hintText: "",
                                  hintStyle: TextStyle(
                                      color: bgblack.withOpacity(0.5))),
                              onChanged: (val) {
                                setState(() {
                                  namee = val;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _QualificationsController,
                              decoration: textInputDecoration.copyWith(
                                  labelText: "Qualifications",
                                  hintText: "",
                                  hintStyle: TextStyle(
                                      color: bgblack.withOpacity(0.5))),
                              onChanged: (val) {
                                setState(() {
                                  qualificationss = val;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _SkillsController,
                              decoration: textInputDecoration.copyWith(
                                  labelText: "Skills",
                                  hintText: "",
                                  hintStyle: TextStyle(
                                      color: bgblack.withOpacity(0.5))),
                              onChanged: (val) {
                                setState(() {
                                  skillss = val;
                                });
                              },
                            ),
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.menu),
                              style:
                                  const TextStyle(color: bgblack, fontSize: 18),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'One',
                                  child: Text('Architecture'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Two',
                                  child: Text('Driver'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Three',
                                  child: Text('Electrician'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Four',
                                  child: Text('Engineer'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Five',
                                  child: Text('Plumber'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Six',
                                  child: Text('Teacher'),
                                )
                              ],
                            ),
                            //google
                            const SizedBox(
                              height: 20,
                            ),
                            //erroe text
                            Text(
                              error,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Register with Google",
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
                                  "Do you have a account?",
                                  style: discriptionStyle,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  //go to the Loginpage
                                  onTap: () {
                                    widget.toggle();
                                  },
                                  child: const Text(
                                    "Log in",
                                    style: TextStyle(
                                        color: bgblue,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            //button
                            GestureDetector(
                              //method for login user
                              onTap: () async {
                                if (dropdownValue == 'One') {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  )
                                      .then((signedInUser) {
                                    UserManagement().storeNewUser(
                                        skillss,
                                        qualificationss,
                                        namee,
                                        signedInUser.user,
                                        context);
                                  }).catchError((e) {
                                    print(e);
                                  });
                                } else if (dropdownValue == 'Two') {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  )
                                      .then((signedInUser) {
                                    UserManagement2().storeNewUser(
                                        skillss,
                                        qualificationss,
                                        namee,
                                        signedInUser.user,
                                        context);
                                  }).catchError((e) {
                                    print(e);
                                  });
                                } else if (dropdownValue == 'Three') {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  )
                                      .then((signedInUser) {
                                    UserManagement3().storeNewUser(
                                        skillss,
                                        qualificationss,
                                        namee,
                                        signedInUser.user,
                                        context);
                                  }).catchError((e) {
                                    print(e);
                                  });
                                } else if (dropdownValue == 'Four') {
                                  print("got to four");
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  )
                                      .then((signedInUser) {
                                    UserManagement4().storeNewUser(
                                        skillss,
                                        qualificationss,
                                        namee,
                                        signedInUser.user,
                                        context);
                                  }).catchError((e) {
                                    print(e);
                                  });
                                } else if (dropdownValue == 'Five') {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  )
                                      .then((signedInUser) {
                                    UserManagement5().storeNewUser(
                                        skillss,
                                        qualificationss,
                                        namee,
                                        signedInUser.user,
                                        context);
                                  }).catchError((e) {
                                    print(e);
                                  });
                                } else if (dropdownValue == 'Six') {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  )
                                      .then((signedInUser) {
                                    UserManagement6().storeNewUser(
                                        skillss,
                                        qualificationss,
                                        namee,
                                        signedInUser.user,
                                        context);
                                  }).catchError((e) {
                                    print(e);
                                  });
                                } else {
                                  print("not got one");
                                }

                                // getUserIdNow() async {
                                //   User? user = FirebaseAuth.instance.currentUser;
                                //   if (user != null) {
                                //     userId = user.uid;
                                //     print('Current User ID: $userId');
                                //   } else {
                                //     userId = "hoooo";
                                //     print('No user is currently logged in.');
                                //   }
                                // }

                                // if (dropdownValue == 'One') {
                                //   addUserDetails(
                                //     userIdd,
                                //     _NameController.text.trim(),
                                //     _EmailController.text.trim(),
                                //     _QualificationsController.text.trim(),
                                //     _SkillsController.text.trim(),
                                //   );
                                // }
                                dynamic results =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (results == null) {
                                  //error
                                  setState(() {
                                    error = "Check your email and password";
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
                                    child: Text("REGISTER",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500))),
                              ),
                            ),
                            //anon
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
