import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Author : Ketan Ramani
// Use : To Show Platform Specific Dialog (Android & iOS)

class AdaptiveDialog extends StatelessWidget {
  final String? title, message, left, right;
  final bool iOSRedButton;
  final VoidCallback? leftClick, rightClick;

  const AdaptiveDialog({
    Key? key,
    this.title = '',
    @required this.message,
    @required this.left,
    @required this.right,
    @required this.leftClick,
    @required this.rightClick,
    this.iOSRedButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: title != ''
                ? Text(
                    title!,
                    style: const TextStyle(color: CupertinoColors.black),
                  )
                : null,
            content: Text(
              message!,
              style: const TextStyle(color: CupertinoColors.black),
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  left!,
                  style: const TextStyle(color: CupertinoColors.activeBlue),
                ),
                onPressed: leftClick,
              ),
              CupertinoDialogAction(
                child: Text(
                  right!,
                  style: TextStyle(
                    color: iOSRedButton
                        ? CupertinoColors.systemRed
                        : CupertinoColors.activeBlue,
                  ),
                ),
                onPressed: rightClick,
              ),
            ],
          )
        : AlertDialog(
            title: title != '' ? Text(title!) : null,
            content: Text(message!),
            actions: <Widget>[
              TextButton(
                child: Text(left!),
                onPressed: leftClick,
              ),
              TextButton(
                child: Text(right!),
                onPressed: rightClick,
              ),
            ],
          );
  }
}
