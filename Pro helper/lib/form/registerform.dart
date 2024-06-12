import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/constans/colors.dart';
import 'package:pro/constans/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _fullNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  String dropdownValue = 'One';

  @override
  void dispose() {
    _fullNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future addUserDetails(
    String fullName,
    String lastNAme,
  ) async {
    await FirebaseFirestore.instance.collection('Doctor').add({
      'full name': fullName,
      'last name': lastNAme,
    });
  }

  Future addUserDetailsOther(
    String fullName,
    String lastNAme,
  ) async {
    await FirebaseFirestore.instance.collection('Teacher').add({
      'full name': fullName,
      'last name': lastNAme,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBackground,
      appBar: AppBar(
        backgroundColor: bgAppBar,
      ),
      body: Column(
        children: [
          const SingleChildScrollView(),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _fullNameController,
            decoration: textInputDecoration.copyWith(
                hintText: "",
                labelText: "Full Name",
                hintStyle: TextStyle(color: bgblack.withOpacity(0.5))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _lastNameController,
            decoration: textInputDecoration.copyWith(
                hintText: "",
                labelText: "Full Name",
                hintStyle: TextStyle(color: bgblack.withOpacity(0.5))),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.menu),
            style: const TextStyle(color: bgblue),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: const [
              DropdownMenuItem<String>(
                value: 'One',
                child: Text('One'),
              ),
              DropdownMenuItem<String>(
                value: 'Two',
                child: Text('Two'),
              ),
              DropdownMenuItem<String>(
                value: 'Three',
                child: Text('Three'),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (dropdownValue == 'Two') {
                addUserDetailsOther(
                  _fullNameController.text.trim(),
                  _lastNameController.text.trim(),
                );
              } else {
                addUserDetails(
                  _fullNameController.text.trim(),
                  _lastNameController.text.trim(),
                );
              }
            },
            child: Container(
              height: 100,
              width: 200,
              decoration: const BoxDecoration(
                color: bgblue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
