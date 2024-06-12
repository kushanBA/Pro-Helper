import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/constans/colors.dart';
import 'package:pro/screens/categories/Architecturer.dart';
import 'package:pro/screens/categories/driver.dart';
import 'package:pro/screens/categories/electrician.dart';
import 'package:pro/screens/categories/engineer.dart';
import 'package:pro/screens/categories/plumber.dart';
import 'package:pro/screens/categories/teacher.dart';
import 'package:pro/screens/home/profile.dart';
import 'package:pro/screens/home/profilepictest.dart';
import 'package:pro/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  // final Function toggle2;
  // const Home({super.key, required this.toggle2});

  @override
  State<Home> createState() => _HomeState();
}

final crFor = FirebaseAuth.instance.currentUser;
String crp = crFor!.uid.toString();

class _HomeState extends State<Home> {
  String dropDownValue = "One";
  //create a obj from auth services
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: bgBackground,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return GetData();
                    },
                  ),
                );
                print(crFor);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(Icons.person_3_outlined),
              ),
            ),
            elevation: 0,
            backgroundColor: bgAppBar,
            title: const Text("Category"),
            centerTitle: true,
            actions: [
              GestureDetector(
                  onTap: () async {
                    // await _auth.signOut();
                    await FirebaseAuth.instance.signOut();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.logout_rounded),
                  )),
              // ElevatedButton(
              //     onPressed: () async {
              //       await _auth.signOut();
              //     },
              //     style: const ButtonStyle(
              //         backgroundColor: MaterialStatePropertyAll(bgAppBar)),
              //     child: const Icon(Icons.logout_rounded)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return const Plumbers();
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: bgcat,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(
                                        "assets/plumber_output.png",
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  const Text("Plumber",
                                      style: TextStyle(fontFamily: 'Poppins'))
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return const Teacher();
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: bgcat,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(
                                        "assets/pngwing.com (3).png",
                                      ),
                                    ),
                                  ),
                                  const Text("Teacher",
                                      style: TextStyle(fontFamily: 'Poppins'))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return const Electrician();
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: bgcat,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(
                                        "assets/pngwing.com (4).png",
                                      ),
                                    ),
                                  ),
                                  const Text("Electrician",
                                      style: TextStyle(fontFamily: 'Poppins'))
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return const Engineer();
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: bgcat,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(
                                          "assets/pngwing.com (6).png"),
                                    ),
                                  ),
                                  const Text("Engineer",
                                      style: TextStyle(fontFamily: 'Poppins'))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return const Architecturer();
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: bgcat,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(
                                          "assets/pngwing.com (5).png"),
                                    ),
                                  ),
                                  const Text("Architecturer",
                                      style: TextStyle(fontFamily: 'Poppins'))
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return const Driver();
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: bgcat,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(
                                          "assets/pngwing.com (7).png"),
                                    ),
                                  ),
                                  const Text(
                                    "Driver",
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
