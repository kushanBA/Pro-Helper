import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro/models/UserModels.dart';
import 'package:pro/screens/authentication/updatepro.dart';
import 'package:pro/screens/home/profile.dart';

class AuthServices {
  //firebase

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference teacherUpdate =
      FirebaseFirestore.instance.collection('Teacher');
  final CollectionReference driverUpdate =
      FirebaseFirestore.instance.collection('Driver');
  final CollectionReference architecturerUpdate =
      FirebaseFirestore.instance.collection('Architecturer');
  final CollectionReference plumberUpdate =
      FirebaseFirestore.instance.collection('Plumber');
  final CollectionReference electricianUpdate =
      FirebaseFirestore.instance.collection('Electrician');
  final CollectionReference engineerUpdate =
      FirebaseFirestore.instance.collection('Engineer');

  //create a user with user id

  UserModel? _userWithFireBaseUserId(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFireBaseUserId);
  }

  //sign in anonymous
  Future singInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFireBaseUserId(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //get id to collection

  //register using email and email
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential results = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = results.user;
      return _userWithFireBaseUserId(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //sign in using email and password
  Future signInUsingEmailAndPassword(String email, String password) async {
    try {
      UserCredential results = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = results.user;
      return _userWithFireBaseUserId(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //sign in google
  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //Update user

  Future<void> updateUserD(
      String uid, String nameUp, String qualificationsUp, String skilsUp) {
    Map<String, dynamic> updateData = {};
    if (nameUp.isNotEmpty) {
      updateData['name'] = nameUp;
    }
    if (qualificationsUp.isNotEmpty) {
      updateData['qualifications'] = qualificationsUp;
    }
    if (skilsUp.isNotEmpty) {
      updateData['skills'] = skilsUp;
    }
    print("check");
    return driverUpdate.doc(uid).update(updateData);
  }

  Future<void> updateUserT(
      String uid, String nameUp, String qualificationsUp, String skilsUp) {
    Map<String, dynamic> updateData = {};
    if (nameUp.isNotEmpty) {
      updateData['name'] = nameUp;
    }
    if (qualificationsUp.isNotEmpty) {
      updateData['qualifications'] = qualificationsUp;
    }
    if (skilsUp.isNotEmpty) {
      updateData['skills'] = skilsUp;
    }
    return teacherUpdate.doc(uid).update(updateData);
  }

  Future<void> updateUserA(
      String uid, String nameUp, String qualificationsUp, String skilsUp) {
    Map<String, dynamic> updateData = {};
    if (nameUp.isNotEmpty) {
      updateData['name'] = nameUp;
    }
    if (qualificationsUp.isNotEmpty) {
      updateData['qualifications'] = qualificationsUp;
    }
    if (skilsUp.isNotEmpty) {
      updateData['skills'] = skilsUp;
    }
    return architecturerUpdate.doc(uid).update(updateData);
  }

  Future<void> updateUserE(
      String uid, String nameUp, String qualificationsUp, String skilsUp) {
    Map<String, dynamic> updateData = {};
    if (nameUp.isNotEmpty) {
      updateData['name'] = nameUp;
    }
    if (qualificationsUp.isNotEmpty) {
      updateData['qualifications'] = qualificationsUp;
    }
    if (skilsUp.isNotEmpty) {
      updateData['skills'] = skilsUp;
    }
    return electricianUpdate.doc(uid).update(updateData);
  }

  Future<void> updateUserEn(
      String uid, String nameUp, String qualificationsUp, String skilsUp) {
    Map<String, dynamic> updateData = {};
    if (nameUp.isNotEmpty) {
      updateData['name'] = nameUp;
    }
    if (qualificationsUp.isNotEmpty) {
      updateData['qualifications'] = qualificationsUp;
    }
    if (skilsUp.isNotEmpty) {
      updateData['skills'] = skilsUp;
    }
    return engineerUpdate.doc(uid).update(updateData);
  }

  Future<void> updateUserP(
      String uid, String nameUp, String qualificationsUp, String skilsUp) {
    Map<String, dynamic> updateData = {};
    if (nameUp.isNotEmpty) {
      updateData['name'] = nameUp;
    }
    if (qualificationsUp.isNotEmpty) {
      updateData['qualifications'] = qualificationsUp;
    }
    if (skilsUp.isNotEmpty) {
      updateData['skills'] = skilsUp;
    }
    return plumberUpdate.doc(uid).update(updateData);
  }

  //Delete a user
  Future deleteUserTe(String uidFD) async {
    await teacherUpdate.doc(uidFD).delete();
    await FirebaseAuth.instance.signOut();
  }

  Future deleteUserDr(String uidFD) async {
    await driverUpdate.doc(uidFD).delete();
    await FirebaseAuth.instance.signOut();
  }

  Future deleteUserAr(String uidFD) async {
    await architecturerUpdate.doc(uidFD).delete();
    await FirebaseAuth.instance.signOut();
  }

  Future deleteUserEl(String uidFD) async {
    await electricianUpdate.doc(uidFD).delete();
    await FirebaseAuth.instance.signOut();
  }

  Future deleteUserEn(String uidFD) async {
    print("check this");
    await engineerUpdate.doc(uidFD).delete();
    await FirebaseAuth.instance.signOut();
  }

  Future deleteUserPl(String uidFD) async {
    await plumberUpdate.doc(uidFD).delete();
    await FirebaseAuth.instance.signOut();
  }
}
