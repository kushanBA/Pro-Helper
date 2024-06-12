import 'package:flutter/material.dart';
import 'package:pro/models/UserModels.dart';
import 'package:pro/screens/authentication/authentication.dart';
import 'package:pro/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return const Authentication();
    } else {
      return const Home();
    }
  }
}
