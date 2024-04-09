import 'package:flutter/material.dart';
import 'package:mp_tic_tak_toe/app/utils/constants.dart';

class CustomerTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isReadOnly;

  const CustomerTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ]),
      child: TextField(
        controller: controller,
        readOnly: isReadOnly,
        decoration: InputDecoration(
          fillColor: MyColors.bgColor,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
