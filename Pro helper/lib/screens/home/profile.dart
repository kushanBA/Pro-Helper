import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pro/constans/colors.dart';
import 'package:pro/screens/authentication/login.dart';
import 'package:pro/screens/authentication/register.dart';
import 'package:pro/screens/authentication/updatepro.dart';
import 'package:pro/screens/home/home.dart';
import 'package:pro/services/auth.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

final AuthServices _auth = AuthServices();

User? user1 = crFor;
String userId = "";
String myName = "";
String myQualifications = "";
String mySkills = "";
String nullc = "";
final firebaseUser11 = FirebaseAuth.instance.currentUser;

final firebaseSixthCollection =
    FirebaseFirestore.instance.collection('Teacher');

class _GetDataState extends State<GetData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgAppBar,
          title: const Text("My profile"),
          centerTitle: true,
          actions: [
            // ElevatedButton(
            //     onPressed: () async {
            //       await FirebaseAuth.instance.signOut();
            //     },
            //     style: const ButtonStyle(
            //         backgroundColor: MaterialStatePropertyAll(bgAppBar)),
            //     child: const Icon(Icons.logout_rounded)),
          ],
        ),
        // body: Column(
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {
        //         _fetch();
        //       },
        //       child: null,
        //     ),
        //     FutureBuilder(
        //       future: _fetch(),
        //       builder: (context, snapshot) {
        //         if (snapshot.connectionState != ConnectionState.done) {
        //           return const Text("Loading data...Please waits!");
        //         } else {
        //           return Text(
        //             "Name: $myName,Qualifications: $myQualifications,Skills: $mySkills",
        //             style: const TextStyle(backgroundColor: bgblue),
        //           );
        //         }
        //       },
        //     ),
        //   ],
        // ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/pngwing.com (8).png",
                width: 200,
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     _fetch();
            //   },
            //   child: null,
            // ),
            FutureBuilder(
              future: _fetch(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Text("Loading data... Please wait!");
                } else {
                  // Assuming you have a List of items
                  List<String> items = [
                    " $myName",
                    "Qualifications: $myQualifications",
                    "Skills: $mySkills"
                  ];

                  return Expanded(
                    child: Center(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.all(8.0),
                            elevation: 4.0,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                items[index],
                                style: TextStyle(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // final specialDoc =
                          //     await firebaseSixthCollection.doc(user1?.uid).get();
                          if (nullc != "nullc") {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return const UpdateUser();
                            }));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Close"))
                                      ],
                                      title: const Text("Not Registered"),
                                      contentPadding: const EdgeInsets.all(20),
                                      content: const Text(
                                          'Please register your account'),
                                    ));
                          }
                        },
                        child: Container(
                          width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                            color: bgButton,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(width: 2, color: bgBorder),
                          ),
                          child: const Center(
                            child: Text(
                              "Edit profile",
                              style: TextStyle(color: bgyellow, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await deleteAUserProfile();
                        },
                        child: Container(
                          width: 180,
                          height: 60,
                          decoration: BoxDecoration(
                            color: bgButton,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(width: 2, color: bgBorder),
                          ),
                          child: Center(
                            child: Text(
                              "Delete profile",
                              style: TextStyle(color: bgyellow, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //Delete a profile
  deleteAUserProfile() async {
    //deleteteacher
    //deletedriver
    //deletearchi
    //delete elec
    //delete engi
    //delete plum
    if (nullc != "nullc") {
      try {
        final dltTe = await _auth.teacherUpdate.doc(firebaseUser11!.uid).get();
        if (dltTe.exists) {
          return _auth.deleteUserTe(firebaseUser11!.uid);
        }
      } catch (e) {
        print(e.toString());
      }
      try {
        final dltDri = await _auth.driverUpdate.doc(firebaseUser11!.uid).get();
        if (dltDri.exists) {
          return _auth.deleteUserDr(firebaseUser11!.uid);
        }
      } catch (e) {
        print(e.toString());
      }
      try {
        final dltArchi =
            await _auth.architecturerUpdate.doc(firebaseUser11!.uid).get();
        if (dltArchi.exists) {
          return _auth.deleteUserAr(firebaseUser11!.uid);
        }
      } catch (e) {
        print(e.toString());
      }
      try {
        final dltElec =
            await _auth.electricianUpdate.doc(firebaseUser11!.uid).get();
        if (dltElec.exists) {
          return _auth.deleteUserEl(firebaseUser11!.uid);
        }
      } catch (e) {
        print(e.toString());
      }
      try {
        final dltEngi =
            await _auth.engineerUpdate.doc(firebaseUser11!.uid).get();
        if (dltEngi.exists) {
          return _auth.deleteUserEn(firebaseUser11!.uid);
        }
      } catch (e) {
        print(e.toString());
      }
      try {
        final dltPlumb =
            await _auth.plumberUpdate.doc(firebaseUser11!.uid).get();
        if (dltPlumb.exists) {
          return _auth.deleteUserPl(firebaseUser11!.uid);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"))
                ],
                title: const Text("Not Registered"),
                contentPadding: const EdgeInsets.all(20),
                content: const Text('Please register your account'),
              ));
    }
  }
}

//Retrieve data to profile
_fetch() async {
  final firebaseUser = FirebaseAuth.instance.currentUser;
  nullc = "";
  if (firebaseUser != null) {
    print(firebaseUser.uid);
    //first collection
    final firebaseFirstCollection =
        FirebaseFirestore.instance.collection('Architecturer');
    final firstDoc = await firebaseFirstCollection.doc(firebaseUser.uid).get();
    //second collection
    final firebaseSecondCollection =
        FirebaseFirestore.instance.collection('Driver');
    final secondDoc =
        await firebaseSecondCollection.doc(firebaseUser.uid).get();
    //third collection
    final firebaseThirdCollection =
        FirebaseFirestore.instance.collection('Electrician');
    final thirdDoc = await firebaseThirdCollection.doc(firebaseUser.uid).get();
    //fourth collection
    final firebaseFourthCollection =
        FirebaseFirestore.instance.collection('Engineer');
    final fourthDoc =
        await firebaseFourthCollection.doc(firebaseUser.uid).get();
    //fifth collection
    final firebaseFifthCollection =
        FirebaseFirestore.instance.collection('Plumber');
    final fifthDoc = await firebaseFifthCollection.doc(firebaseUser.uid).get();
    //sixth collection
    final firebaseSixthCollection =
        FirebaseFirestore.instance.collection('Teacher');
    final sixthDoc = await firebaseSixthCollection.doc(firebaseUser.uid).get();

    if (firstDoc.exists) {
      await FirebaseFirestore.instance
          .collection('Architecturer')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds.data()?['name'] ?? "Email Not Available";
        myQualifications =
            ds.data()?['qualifications'] ?? "Qualifications Not Available";
        mySkills = ds.data()?['skills'] ?? "Skills Not Available";
      }).catchError((e) {
        print(e);
      });
    } else if (secondDoc.exists) {
      await FirebaseFirestore.instance
          .collection('Driver')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds.data()?['name'] ?? "Email Not Available";
        myQualifications =
            ds.data()?['qualifications'] ?? "Qualifications Not Available";
        mySkills = ds.data()?['skills'] ?? "Skills Not Available";
      }).catchError((e) {
        print(e);
      });
    } else if (thirdDoc.exists) {
      await FirebaseFirestore.instance
          .collection('Electrician')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds.data()?['name'] ?? "Email Not Available";
        myQualifications =
            ds.data()?['qualifications'] ?? "Qualifications Not Available";
        mySkills = ds.data()?['skills'] ?? "Skills Not Available";
      }).catchError((e) {
        print(e);
      });
    } else if (fourthDoc.exists) {
      await FirebaseFirestore.instance
          .collection('Engineer')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds.data()?['name'] ?? "Email Not Available";
        myQualifications =
            ds.data()?['qualifications'] ?? "Qualifications Not Available";
        mySkills = ds.data()?['skills'] ?? "Skills Not Available";
      }).catchError((e) {
        print(e);
      });
    } else if (fifthDoc.exists) {
      await FirebaseFirestore.instance
          .collection('Plumber')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds.data()?['name'] ?? "Email Not Available";
        myQualifications =
            ds.data()?['qualifications'] ?? "Qualifications Not Available";
        mySkills = ds.data()?['skills'] ?? "Skills Not Available";
      }).catchError((e) {
        print(e);
      });
    } else if (sixthDoc.exists) {
      await FirebaseFirestore.instance
          .collection('Teacher')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds.data()?['name'] ?? "Email Not Available";
        myQualifications =
            ds.data()?['qualifications'] ?? "Qualifications Not Available";
        mySkills = ds.data()?['skills'] ?? "Skills Not Available";
      }).catchError((e) {
        print(e);
      });
    } else {
      print("null user");
      myName = "Not registered";
      myQualifications = "Qualifications Not Availablee";
      mySkills = "Skills Not Availablee";
      nullc = "nullc";
    }
  } else {}
}
