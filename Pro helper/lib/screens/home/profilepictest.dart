import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro/constans/colors.dart';

class TestProfilePic extends StatefulWidget {
  const TestProfilePic({super.key});

  @override
  State<TestProfilePic> createState() => _nameState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//profile pic method
Future uploadImage() async {
  final User? user = _auth.currentUser;
  final ImagePicker _imagePicker = ImagePicker();
  final XFile? imageFile =
      await _imagePicker.pickImage(source: ImageSource.gallery);

  if (imageFile != null) {
    final Reference storageRef =
        _storage.ref().child('profile_pictures/${user!.uid}');
    final UploadTask uploadTask = storageRef.putFile(File(imageFile.path));

    await uploadTask.whenComplete(() async {
      final String profilePictureURL = await storageRef.getDownloadURL();

      // Update the user's profile picture URL in Firestore
      await _firestore.collection('Engineer').doc(user.uid).set({
        'profilePictureURL': profilePictureURL,
      }, SetOptions(merge: true));
    });
  }
}

class _nameState extends State<TestProfilePic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgAppBar,
        title: Text("Edit Profile"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                print("object");
                uploadImage();
              },
              child: Icon(Icons.person_2_rounded),
            ),
          ),
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}
