import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement {
  // final auth = FirebaseAuth.instance;

  storeNewUser(
    qualifications,
    skills,
    name,
    user,
    context,
  ) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Architecturer')
        .doc(firebaseUser!.uid)
        .set({
      'email': user.email,
      'uid': user.uid,
      'name': name,
      'qualifications': qualifications,
      'skills': skills,
    }).catchError((e) {
      print(e);
    });
  }
}

class UserManagement2 {
  // final auth = FirebaseAuth.instance;

  storeNewUser(
    qualifications,
    skills,
    name,
    user,
    context,
  ) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('Driver').doc(firebaseUser!.uid).set({
      'email': user.email,
      'uid': user.uid,
      'name': name,
      'qualifications': qualifications,
      'skills': skills,
    }).catchError((e) {
      print(e);
    });
  }
}

class UserManagement3 {
  // final auth = FirebaseAuth.instance;

  storeNewUser(
    qualifications,
    skills,
    name,
    user,
    context,
  ) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Electrician')
        .doc(firebaseUser!.uid)
        .set({
      'email': user.email,
      'uid': user.uid,
      'name': name,
      'qualifications': qualifications,
      'skills': skills,
    }).catchError((e) {
      print(e);
    });
  }
}

class UserManagement4 {
  // final auth = FirebaseAuth.instance;

  storeNewUser(
    qualifications,
    skills,
    name,
    user,
    context,
  ) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Engineer')
        .doc(firebaseUser!.uid)
        .set({
      'email': user.email,
      'uid': user.uid,
      'name': name,
      'qualifications': qualifications,
      'skills': skills,
    }).catchError((e) {
      print(e);
    });
  }
}

class UserManagement5 {
  // final auth = FirebaseAuth.instance;

  storeNewUser(
    qualifications,
    skills,
    name,
    user,
    context,
  ) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Plumber')
        .doc(firebaseUser!.uid)
        .set({
      'email': user.email,
      'uid': user.uid,
      'name': name,
      'qualifications': qualifications,
      'skills': skills,
    }).catchError((e) {
      print(e);
    });
  }
}

class UserManagement6 {
  // final auth = FirebaseAuth.instance;

  storeNewUser(
    qualifications,
    skills,
    name,
    user,
    context,
  ) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Teacher')
        .doc(firebaseUser!.uid)
        .set({
      'email': user.email,
      'uid': user.uid,
      'name': name,
      'qualifications': qualifications,
      'skills': skills,
    }).catchError((e) {
      print(e);
    });
  }
}
