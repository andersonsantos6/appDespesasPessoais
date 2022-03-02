import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController formController;

  final Function(String)? onSubmitted;
  final String label;
  final TextInputType inputTypeAdaptativeForm;

  AdaptativeTextField(
      {Key? key,
      required this.formController,
      required this.onSubmitted,
      required this.label,
      this.inputTypeAdaptativeForm = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
              controller: formController,
              prefix: Text(label),
              onSubmitted: onSubmitted,
              keyboardType: inputTypeAdaptativeForm,
            ),
          )
        : TextField(
            controller: formController,
            decoration: InputDecoration(labelText: label),
            onSubmitted: onSubmitted,
            keyboardType: inputTypeAdaptativeForm,
          );
  }
}
