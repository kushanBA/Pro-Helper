import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/constans/colors.dart';
import 'package:pro/constans/styles.dart';
import 'package:pro/screens/home/profile.dart';
import 'package:pro/services/auth.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

final _NameUpController = TextEditingController();
final _QualificationsUpController = TextEditingController();
final _SkillsUpController = TextEditingController();
final uid = user1?.uid;

String nameUp = "";
String qualificationsUp = "";
String skillsUp = "";
String userIdd = uid.toString();

final userte = FirebaseAuth.instance.currentUser!.uid;

FirebaseFirestore firestore = FirebaseFirestore.instance;
final AuthServices auth__ = AuthServices();

void clearText() {
  _NameUpController.clear();
  _QualificationsUpController.clear();
  _SkillsUpController.clear();
}

class _UpdateUserState extends State<UpdateUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bgAppBar,
          title: Text("Edit Profile"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/pngwing.com (10).png",
                    width: 150,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _NameUpController,
                  decoration: textInputDecoration.copyWith(
                      labelText: "Enter Your Name",
                      labelStyle: TextStyle(color: bgblack.withOpacity(0.3)),
                      hintText: "",
                      hintStyle: TextStyle(color: bgblack.withOpacity(0.5))),
                  onChanged: (val) {
                    setState(() {
                      nameUp = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _QualificationsUpController,
                  decoration: textInputDecoration.copyWith(
                      labelText: "Enter your new qualifications",
                      labelStyle: TextStyle(color: bgblack.withOpacity(0.3)),
                      hintText: "",
                      hintStyle: TextStyle(color: bgblack.withOpacity(0.5))),
                  onChanged: (val) {
                    setState(() {
                      qualificationsUp = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _SkillsUpController,
                  decoration: textInputDecoration.copyWith(
                      labelText: "Enter your new skills",
                      labelStyle: TextStyle(color: bgblack.withOpacity(0.3)),
                      hintText: "",
                      hintStyle: TextStyle(color: bgblack.withOpacity(0.2))),
                  onChanged: (val) {
                    setState(() {
                      skillsUp = val;
                    });
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () async {
                    await updateDetails();
                  },
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      color: bgButton,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 2, color: bgBorder),
                    ),
                    child: Center(
                      child: Text(
                        "Update",
                        style: TextStyle(color: bgyellow, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateDetails() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    //archi doc
    final archiDoc =
        await auth__.architecturerUpdate.doc(firebaseUser?.uid).get();
    //driver doc
    final driverDoc = await auth__.driverUpdate.doc(firebaseUser?.uid).get();
    //elec doc
    final elecDoc = await auth__.electricianUpdate.doc(firebaseUser?.uid).get();
    //engi doc
    final EngiDoc = await auth__.engineerUpdate.doc(firebaseUser?.uid).get();
    //plumber doc
    final plumberDoc = await auth__.plumberUpdate.doc(firebaseUser?.uid).get();
    //teacher doc
    final teachDoc = await auth__.teacherUpdate.doc(firebaseUser?.uid).get();

    if (archiDoc.exists) {
      auth__.updateUserA(userte, nameUp, qualificationsUp, skillsUp);
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => GetData()));
      return clearText();
    } else if (driverDoc.exists) {
      auth__.updateUserD(userte, nameUp, qualificationsUp, skillsUp);
      print("object");
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => GetData()));
      return clearText();
    } else if (elecDoc.exists) {
      auth__.updateUserE(userte, nameUp, qualificationsUp, skillsUp);
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => GetData()));
      return clearText();
    } else if (EngiDoc.exists) {
      auth__.updateUserEn(userte, nameUp, qualificationsUp, skillsUp);
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => GetData()));
      return clearText();
    } else if (plumberDoc.exists) {
      auth__.updateUserP(userte, nameUp, qualificationsUp, skillsUp);
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => GetData()));
      return clearText();
    } else if (teachDoc.exists) {
      auth__.updateUserT(userte, nameUp, qualificationsUp, skillsUp);
      print(userte);
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => GetData()));
      return clearText();
    } else {
      (null);
    }
  }
}
