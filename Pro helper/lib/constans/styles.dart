import 'package:flutter/material.dart';
import 'package:pro/constans/colors.dart';

const TextStyle discriptionStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
);
const textInputDecoration = InputDecoration(
  hintText: "Password",
  filled: true,
  fillColor: bgTextBackground,
  hintStyle: TextStyle(color: bgblack, fontSize: 15),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: bgBorder, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);

const buttonborSty = OutlineInputBorder(
  borderSide: BorderSide(color: bgBorder, width: 2),
  borderRadius: BorderRadius.all(Radius.circular(20)),
);
