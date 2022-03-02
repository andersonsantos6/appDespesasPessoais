import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CupertinoButton(
              child: Text(label),
              onPressed: onPressed(),
              color: Theme.of(context).primaryColor,
            ),
          )
        : RaisedButton(
            textColor: Theme.of(context).textTheme.button!.color,
            color: Theme.of(context).primaryColor,
            onPressed: () => onPressed(),
            child: Text(label),
          );
  }
}
